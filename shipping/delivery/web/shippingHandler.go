package web

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping"
	"net/http"

	"github.com/labstack/echo"
	"github.com/sirupsen/logrus"
	"gopkg.in/go-playground/validator.v9"
)

type ShippingHandler struct {
	shippingUsecase shipping.Usecase
}

func NewShippingHandler(e *echo.Echo, usecase shipping.Usecase) {
	handler := &ShippingHandler{
		shippingUsecase: usecase,
	}
	e.POST("/api/shippings", handler.Add)
}

//Add add a new shipping by given request body and write the created shipping id as the response
//Add implements echo.HandlerFunc function signature
func (sh *ShippingHandler) Add(c echo.Context) error {

	var shippingForm models.ShippingForm
	err := c.Bind(&shippingForm)
	if err != nil {
		return c.JSON(http.StatusUnprocessableEntity, err.Error())
	}
	if valid, err := isRequestValid(&shippingForm); !valid {
		return c.JSON(http.StatusBadRequest, err.Error())
	}

	lastInsertedId, err := sh.shippingUsecase.Add(shippingForm)
	if err != nil {
		return c.JSON(getStatusCode(err), ResponseError{Message: err.Error()})
	}
	return c.JSON(http.StatusCreated, map[string]interface{}{"id": lastInsertedId})
}

type ResponseError struct {
	Message string `json:"message"`
}

func isRequestValid(m *models.ShippingForm) (bool, error) {
	validate := validator.New()
	err := validate.Struct(m)
	if err != nil {
		return false, err
	}
	return true, nil
}

func getStatusCode(err error) int {
	if err == nil {
		return http.StatusOK
	}
	logrus.Error(err)
	switch err {
	case models.ErrInternalServerError:
		return http.StatusInternalServerError
	case models.ErrNotFound:
		return http.StatusNotFound
	case models.ErrConflict:
		return http.StatusConflict
	default:
		return http.StatusInternalServerError
	}
}
