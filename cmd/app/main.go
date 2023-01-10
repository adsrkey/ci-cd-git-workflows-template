package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
	"time"
)

var sleepDuration = 1 * time.Second

func main() {
	log.Println("Starting simple template...")
	stopCh := make(chan os.Signal, 1)

	signal.Notify(stopCh, os.Interrupt, syscall.SIGTERM)
	go func() {
		log.Printf("Stopping with signal: %s \n", <-stopCh)
		os.Exit(1)
	}()

	ticker := time.Ticker{C: time.Tick(sleepDuration)}

	for {
		log.Println("Sleeping/Waiting signal...")
		<-ticker.C
	}
}
