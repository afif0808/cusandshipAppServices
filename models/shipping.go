package models

import "time"

// Shipping represent the shipping model
type Shipping struct {
	ID          int64
	Invoice     string
	Information string
	Date        time.Time
	Customer    Customer
}

// ShippingForm used as form to add or edit shippings
type ShippingForm struct {
	CustomerId  int64  `json:"customer_id" validate:"required"`
	Invoice     string `json:"invoice" validate="required"`
	Information string `json:"information" validate="required"`
}
