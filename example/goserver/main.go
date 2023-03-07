package main

import (
	"fmt"
	//_ "go.uber.org/automaxprocs"
	"net/http"
)

func testHandler(w http.ResponseWriter, r *http.Request) {
	if _, err := w.Write([]byte("ok")); err != nil {
		return
	}
}

func main() {
	http.HandleFunc("/api/test", testHandler)
	err := http.ListenAndServe(":8000", nil)
	if err != nil {
		fmt.Println("ListenAndServe error : ", err)
		return
	}
}
