require 'socket'                                # Get sockets from stdlib

server_port = 2000

puts "Server listening on port #{server_port}"

server = TCPServer.open(server_port)           # Socket to listen on port 2000

loop {
  Thread.start(server.accept) do |client|       # Servers run forever
  puts "client connected..."                   # Wait for a client to connect
  client.puts(Time.now.ctime)                  # Send the time to the client
  client.puts "Closing the connection.. Bye!"
  client.close                                 # Disconnect from the client
end
}
