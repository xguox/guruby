package main

import (
	"google.golang.org/grpc/reflection"
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
	protos.RegisterChatServer(grpcServer, &s)
	reflection.Register(grpcServer)
	log.Println("Running on tcp:8888")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
