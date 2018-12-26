package main

import (
	"guruby/handlers"
	"guruby/protos"
	"log"
	"net"

	"google.golang.org/grpc"
)

func main() {
	lis, err := net.Listen("tcp", ":8888")
	if err != nil {
		log.Fatal("failed tp listen: %v", err)
	}

	s := handlers.Server{}

	grpcServer := grpc.NewServer()
	protos.RegisterPingServer(grpcServer, &s)
	log.Println("Running on tcp:8888")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
