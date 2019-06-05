package main

import (
	"fmt"
	"github.com/apex/log"
	"github.com/julienschmidt/httprouter"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	log.Info("Welcome\n")
}

func Election(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	log.Info("Let's start a new Election\n")
}

func main() {
	log.Info("Initializing the Scrum Poker Server")

	router := httprouter.New()
	router.GET("/", Index)
	router.GET("/election/:name", Election)

	err := http.ListenAndServe(":8080", router)
	if err != nil {
		log.Fatal(fmt.Sprintf("Error while listening to port 8080: %s", err))
	}
}
