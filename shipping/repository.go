package shipping

import "cusandshipAppServices/models"

type Repository interface {
	GetById(id int64) (*models.Shipping, error)
	// Add add new customer then returns its id
	Add(models.ShippingForm) (shippingId int64, err error)
}
