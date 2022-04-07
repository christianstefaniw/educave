package core

import (
	"log"
	"server/src/core/http"

	"github.com/joho/godotenv"
)

func Boot() {
	err := godotenv.Load()
	if err != nil {
		log.Panic(err)
	}

	s := http.Init()
	s.Serve()
}
