package main

import (
	"io"
	"net/http"
	"os"
	"path/filepath"
)

func earlyHintsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Link", "</css/ea.css>; rel=preload; as=style")
	w.Header().Add("Link", "</js/ea.js>; rel=preload; as=script")

	w.WriteHeader(http.StatusEarlyHints)

	workDir := os.Getenv("WORKDIR")
	if workDir == "" {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	w.Header().Set("Cache-Control", "private")

	w.WriteHeader(http.StatusOK)
	f, err := os.Open(filepath.Join(workDir, "index.html"))
	if err != nil {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}
	defer f.Close()

	io.Copy(w, f)
}

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/", earlyHintsHandler)
	http.ListenAndServe("127.0.0.1:8000", mux)
}
