  require 'webrick'

  # File.expand_path just gets 
  #   the absolute path for a given 
  #   relative path, i.e. "." (the current directory)
  root = File.expand_path '.'
  
  # Sets the server to respond to localhost:8000
  #   and servers the file specified as root
  server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
  
  # Needed to start and stop the server
  trap "INT" do server.shutdown; end
  server.start
