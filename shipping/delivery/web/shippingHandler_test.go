package web

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping/mocks"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/bxcodec/faker"
	"github.com/labstack/echo"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
	"github.com/stretchr/testify/require"
)

func TestAdd(t *testing.T) {

	var mockShippingForm models.ShippingForm
	faker.FakeData(&mockShippingForm)
	mockShippingFormJSON, err := json.Marshal(mockShippingForm)
	assert.NoError(t, err)

	mockShippingUsecase := new(mocks.Usecase)
	mockShippingUsecase.On("Add", mock.AnythingOfType("models.ShippingForm")).Return(int64(3), nil).Once()

	handler := ShippingHandler{
		shippingUsecase: mockShippingUsecase,
	}

	e := echo.New()
	rec := httptest.NewRecorder()
	req := httptest.NewRequest(echo.POST, "/api/shipping", strings.NewReader(string(mockShippingFormJSON)))
	req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
	ctx := e.NewContext(req, rec)

	ctx.SetPath("/api/shipping")
	err = handler.Add(ctx)
	require.NoError(t, err)

	assert.Equal(t, http.StatusCreated, rec.Code)
}
