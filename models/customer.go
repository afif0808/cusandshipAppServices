package models

import "time"

// Customer represent the customer model
type Customer struct {
	ID          int64
	Name        string
	Information string
	DateAdded   time.Time
}
