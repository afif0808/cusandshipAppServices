package main

import (
	// "cusandshipAppServices/middleware"
	"cusandshipAppServices/shipping/delivery/web"
	"cusandshipAppServices/shipping/repository"
	"cusandshipAppServices/shipping/usecase"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	dbConn, err := sql.Open("mysql", "root:@tcp(localhost:3306)/cusandship")
	if err != nil {
		fmt.Println(err)
	}
	err = dbConn.Ping()
	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	e := echo.New()
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"http://localhost:321"},
		AllowMethods: []string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodDelete},
	}))

	shippingRepo := repository.NewMysqlShippingRepository(dbConn)
	shippingUsecase := usecase.NewShippingUseCase(shippingRepo)
	web.NewShippingHandler(e, shippingUsecase)

	e.Start(":454")
}
