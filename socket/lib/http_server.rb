
require 'socket'
require 'json'

server = TCPServer.open(2000)

loop do
  client = server.accept                  # Wait for a client to connect
  puts "client connected..."
  request = client.read_nonblock(1020)
  headers, body = request.split("\r\n\r\n", 2)
  status_line = headers.split
  req_type = status_line[0]
  path = status_line[1][1..-1]
  version = status_line[2]
  if File.exist?(path)
    response = File.open(path)
    if req_type == 'GET'
      client.print "#{version} 200 OK\r\nDate: #{Time.now.ctime}\r\nContent-Length: #{response.size}\r\n\r\n#{response.read}"
    elsif req_type == 'POST'
      params = JSON.parse(body)
      client.print "#{version} 200 OK\r\nDate: #{Time.now.ctime}\r\n\r\n"
      client.print response.read.gsub("<%= yield %>", "<li>Name: #{params['viking']['name']}</li><li>E-mail: #{params['viking']['email']}</li>")
    end
  else
    client.puts "#{version} 404 Not Found"
  end
  client.close
end
