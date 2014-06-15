require 'webrick'

root = File.expand_path '.'
server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

server.mount_proc '/hello' do |req, res|
 res.body = 'Hello, world!'
end

trap "INT" do server.shutdown; end
server.start