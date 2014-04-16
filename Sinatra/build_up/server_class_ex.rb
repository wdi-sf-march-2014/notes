require 'webrick'

root = File.expand_path '.'
server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root


# Servlet
class Simple < WEBrick::HTTPServlet::AbstractServlet
    # Handle the GET request
     def do_GET request, response

        response.status = 200
        response['Content-Type'] = 'text/plain'
        response.body = 'My new Hello, World!'
    end
end

# mount the class to handle the request
server.mount "/hello", Simple

trap "INT" do server.shutdown; end
server.start