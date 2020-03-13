package repository

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping"
	"database/sql"

	"github.com/sirupsen/logrus"
)

const (
	shippingSqlFields = "shipping_id,shipping_invoice,shipping_information,shipping_date"
	customerSqlFields = "customer_id,customer_name,customer_information,customer_addedat"
)

type mysqlShippingRepository struct {
	Conn *sql.DB
}

func NewMysqlShippingRepository(conn *sql.DB) shipping.Repository {
	return &mysqlShippingRepository{conn}
}

// fetch reusable code for all shipping retrieval
// mysql query should select shipping table along with the customer table
func (msr *mysqlShippingRepository) fetch(query string, args ...interface{}) ([]*models.Shipping, error) {
	rows, err := msr.Conn.Query(query, args...)
	if err != nil {
		logrus.Error(err)
		return nil, err
	}
	defer func() {
		err := rows.Close()
		if err != nil {
			logrus.Error(err)
		}
	}()
	result := make([]*models.Shipping, 0)
	for rows.Next() {
		s := new(models.Shipping)
		c := models.Customer{}
		rows.Scan(
			&s.ID, &s.Invoice, &s.Information, &s.Date,
			&c.ID, &c.Name, &c.Information, &c.DateAdded,
		)
		s.Customer = c
		result = append(result, s)
	}
	return result, nil
}

// GetById get a single shipping by id
func (msr *mysqlShippingRepository) GetById(id int64) (shipping *models.Shipping, err error) {
	query := `SELECT ` + shippingSqlFields + `,` + customerSqlFields + ` FROM shipping
	INNER JOIN customer ON shipping.customer_id = customer.customer_id WHERE shipping_id = ?`
	shippings, err := msr.fetch(query, id)
	if err != nil {
		return nil, err
	}
	if len(shippings) > 0 {
		shipping = shippings[0]
	} else {
		err = models.ErrNotFound
	}
	return
}

// Add insert a new shipping to mysql database and returns its id
func (msr *mysqlShippingRepository) Add(shippingForm models.ShippingForm) (lastInsertedId int64, err error) {
	query := "INSERT shipping SET shipping_invoice = ? , shipping_information = ? , customer_id = ?"
	res, err := msr.Conn.Exec(query, shippingForm.Invoice, shippingForm.Information, shippingForm.CustomerId)
	if err != nil {
		logrus.Error(err)
	}
	lastInsertedId, err = res.LastInsertId()
	if err != nil {
		logrus.Error(err)
	}
	return
}
