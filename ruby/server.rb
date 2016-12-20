require_relative 'bootstrap'
require 'app/search'

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(SearchServer)
server.run
