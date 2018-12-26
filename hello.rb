#!/usr/bin/env ruby
this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'protos')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'hello_services_pb'
def master
  stub = Protos::Ping::Stub.new('localhost:8888', :this_channel_is_insecure)
  req = Protos::PingMsg.new(greeting: 'Sony')
  resp_obj = stub.say_hello(req)
  puts "Hi from: #{resp_obj.greeting}"
end
master