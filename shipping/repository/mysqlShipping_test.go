package repository_test

import (
	"cusandshipAppServices/models"
	"cusandshipAppServices/shipping/repository"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"gopkg.in/DATA-DOG/go-sqlmock.v1"
)

func TestGetById(t *testing.T) {
	db, mock, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}

	rows := sqlmock.NewRows([]string{
		"shipping_id", "shipping_invoice", "shipping_information", "shipping_date",
		"customer_id", "customer_name", "customer_information", "customer_addedat",
	}).AddRow(1, "SMS0001", "Pakaian , 3 Karung", time.Now(),
		1, "Muhammad Afif", "Just another weirdo", time.Now())
	shippingSqlFields := "shipping_id,shipping_invoice,shipping_information,shipping_date"
	customerSqlFields := "customer_id,customer_name,customer_information,customer_addedat"
	query := `SELECT ` + shippingSqlFields + `,` + customerSqlFields + ` FROM shipping
	INNER JOIN customer ON shipping.customer_id = customer.customer_id WHERE shipping_id = ?`

	mock.ExpectQuery(query).WillReturnRows(rows)
	shippingRepository := repository.NewMysqlShippingRepository(db)
	shippingId := int64(1)
	shipping, err := shippingRepository.GetById(shippingId)
	assert.NoError(t, err)
	assert.NotNil(t, shipping)
}

func TestAdd(t *testing.T) {
	db, mock, err := sqlmock.New()
	if err != nil {
		t.Fatalf("an error '%s' was not expected when opening a stub database connection", err)
	}
	shippingForm := models.ShippingForm{
		Invoice:     "SMS0002",
		Information: "3 Kilo",
		CustomerId:  1,
	}
	query := "INSERT shipping SET shipping_invoice = \\? , shipping_information = \\? , customer_id = \\?"

	mock.ExpectExec(query).
		WithArgs(shippingForm.Invoice, shippingForm.Information, shippingForm.CustomerId).
		WillReturnResult(sqlmock.NewResult(2, 1))
	shippingRepository := repository.NewMysqlShippingRepository(db)
	lastInsertId, err := shippingRepository.Add(shippingForm)
	assert.NoError(t, err)
	assert.NotEqual(t, int64(0), lastInsertId)
	assert.Equal(t, int64(2), lastInsertId)
}
