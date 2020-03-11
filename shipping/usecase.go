package shipping

import "cusandshipAppServices/models"

type Usecase interface {
	GetById(id int64) (*models.Shipping, error)

	// Add add new customer then returns its id
	Add(models.ShippingForm) (lastInsertedId int64, err error)
}
