# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: hello.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "protos.Msg" do
    optional :sender, :string, 1
    optional :receiver, :string, 2
    optional :text, :string, 3
  end
end

module Protos
  Msg = Google::Protobuf::DescriptorPool.generated_pool.lookup("protos.Msg").msgclass
end
