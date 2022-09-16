package main

import (
	"math/rand"
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, map[string]string{
			"message": "Hello World",
		})
	})

	e.GET("/random", func(c echo.Context) error {
		return c.JSON(http.StatusOK, map[string]int32{
			"number": int32(rand.Intn(10)),
		})
	})

	e.Logger.Fatal(e.Start(":1323"))
}
