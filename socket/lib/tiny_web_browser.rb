
require 'socket'
require 'json'

host = 'localhost'
port = 2000

puts 'Send a (GET) or (POST) request?'
type = gets.chomp.downcase
if type == 'get'
	path = '/index.html'
	request = "GET #{path} HTTP/1.0\r\n\r\n"
elsif type == 'post'
	params = {:viking => {} }
	path = '/thanks.html'
	puts 'Enter name:'
	params[:viking][:name] = gets.chomp
	puts 'Enter e-mail:'
	params[:viking][:email] = gets.chomp
	request = "POST #{path} HTTP/1.0\r\nContent-Length: #{params.to_json.size}\r\n\r\n#{params.to_json}"
else
	puts 'Invalid request. Exiting...'
	exit
end
socket = TCPSocket.open(host, port)          # opens a TCP connection to hostname on the port.
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
response_message = headers.split(' ', 3)
status_code = response_message[1]
status_desc = response_message[2]
case status_code
	when '200' then puts body
	when '404' then puts "Error #{status_code}: #{status_desc}"
end
