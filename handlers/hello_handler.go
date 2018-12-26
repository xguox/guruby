package handlers

import (
	"context"
	"guruby/protos"
	"log"
)

type Server struct {
}

func (s *Server) SayHello(ctx context.Context, in *protos.PingMsg) (*protos.PingMsg, error) {
	log.Printf("Receive msg %s", in.Greeting)
	return &protos.PingMsg{Greeting: "fuji"}, nil
}
