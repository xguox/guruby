#!/usr/bin/env ruby
this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'protos')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'hello_services_pb'
require 'pry'
ROUTE_CHAT_NOTES = [
  Protos::Msg.new(sender: 'doh - a deer',
                text: "X-T3"),
  Protos::Msg.new(sender: 'ray - a drop of golden sun',
                text: "X-H1"),
  Protos::Msg.new(sender: 'me - the name I call myself',
                text: "GFX 50S"),
  Protos::Msg.new(sender: 'fa - a longer way to run',
                text: "GFX 50R"),
  Protos::Msg.new(sender: 'soh - with needle and a thread',
                text: "GFX 100s")
]
def master
  stub = Protos::Chat::Stub.new('localhost:8888', :this_channel_is_insecure)
  # req = Protos::Msg.new(ROUTE_CHAT_NOTES)
  resp_obj = stub.chewing(ROUTE_CHAT_NOTES.each)
  # puts "Hi from: #{resp_obj}"
  # loop
  loop do

    obj = resp_obj.next
    unless obj.nil?
      puts "#{obj.sender}: #{obj.text}"
    end
  end
  exit
end
master