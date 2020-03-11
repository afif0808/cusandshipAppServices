package usecase

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping/mocks"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
)

func TestGetById(t *testing.T) {
	mockShippingRepository := new(mocks.Repository)
	mockCustomer := models.Customer{ID: 1, Name: "Muhammad Afif", Information: "Just Another Weirdo", DateAdded: time.Now()}
	mockShipping := models.Shipping{
		ID: 1, Invoice: "SMS001", Information: "3 Kilos", Date: time.Now(),
		Customer: mockCustomer,
	}

	t.Run("success", func(t *testing.T) {
		mockShippingRepository.On("GetById", mock.AnythingOfType("int64")).Return(&mockShipping, nil).Once()
		shippingUsecase := NewShippingUseCase(mockShippingRepository)
		shipping, err := shippingUsecase.GetById(mockShipping.ID)
		assert.NoError(t, err)
		assert.NotNil(t, shipping)
		mockShippingRepository.AssertExpectations(t)
	})

}
func TestAdd(t *testing.T) {
	mockShippingRepository := new(mocks.Repository)
	mockShippingForm := models.ShippingForm{
		Invoice:     "SMS001",
		Information: "3 Kilos",
		CustomerId:  3,
	}
	t.Run("success", func(t *testing.T) {
		mockShippingRepository.On("Add", mock.AnythingOfType("models.ShippingForm")).Return(int64(2), nil).Once()
		shippingUsecase := NewShippingUseCase(mockShippingRepository)
		lastInsertedId, err := shippingUsecase.Add(mockShippingForm)
		assert.Equal(t, int64(2), lastInsertedId)
		assert.NotEqual(t, 0, lastInsertedId)

		assert.NoError(t, err)
		mockShippingRepository.AssertExpectations(t)
	})

}
