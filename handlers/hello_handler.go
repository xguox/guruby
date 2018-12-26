package handlers

import (
	"guruby/protos"
	"io"
	"log"
)

type Server struct{}

func (s *Server) Chewing(stream protos.Chat_ChewingServer) error {
	log.Println("Chewing...")
	for {
		msg, err := stream.Recv()
		if err == io.EOF {
			return nil
		}
		if err != nil {
			log.Println(err.Error())
			return err
		}
		log.Printf("[%s]: %s", msg.Sender, msg.Text)
		stream.Send(&protos.Msg{Sender: "Sony", Receiver: "Fuji", Text: msg.Text + " is not FF !!!"})
	}
}
