package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/", Hello)

	fmt.Println("Listening on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func Hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w,"Hello from go-checkstyle-bot!")
}