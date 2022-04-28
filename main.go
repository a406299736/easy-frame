package main

import (
	http2 "net/http"
	"time"
)

func main() {
	http := http2.NewServeMux()
	http.HandleFunc("/", func(w http2.ResponseWriter, req *http2.Request) {
	})

	server := http2.Server{
		Addr:         ":1210",
		WriteTimeout: time.Second * 3,
		Handler:      http,
	}

	server.ListenAndServe()
}
