package mocks

import (
	"cusandshipAppServices/models"

	"github.com/stretchr/testify/mock"
)

type Repository struct {
	mock.Mock
}

func (_m *Repository) GetById(id int64) (r0 *models.Shipping, r1 error) {
	ret := _m.Called(id)
	if rf, ok := ret.Get(0).(func(int64) *models.Shipping); ok {
		r0 = rf(id)
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(*models.Shipping)
		}
	}

	if rf, ok := ret.Get(1).(func(int64) error); ok {
		r1 = rf(id)
	} else {
		r1 = ret.Error(1)
	}
	return
}
func (_m *Repository) Add(shippingForm models.ShippingForm) (r0 int64, r1 error) {
	ret := _m.Called(shippingForm)
	if ret.Get(0) != nil {
		r0 = ret.Get(0).(int64)
	}

	r1 = ret.Error(1)
	return
}
