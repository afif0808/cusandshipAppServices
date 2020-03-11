package usecase

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping"
)

type shippingUsecase struct {
	shippingRepository shipping.Repository
}

func NewShippingUseCase(sr shipping.Repository) shipping.Usecase {
	return &shippingUsecase{sr}
}

// GetById return a shipping by given id
func (su *shippingUsecase) GetById(id int64) (shipping *models.Shipping, err error) {
	shipping, err = su.shippingRepository.GetById(id)
	return
}

// Add add new customer then returns its id
func (su *shippingUsecase) Add(shippingForm models.ShippingForm) (lastInsertedId int64, err error) {
	lastInsertedId, err = su.shippingRepository.Add(shippingForm)
	return
}
