def caesar_cipher string, number
  caesar_string = ""                #empty string

  string.scan (/./) do |i|
    if ("a".."z").include?(i.downcase)
      number.times { i = i.next }
    end

    caesar_string << i[-1]          #shovel operator << to append to a string (just like with arrays...)
  end

  return caesar_string.capitalize
end


puts "Hello there, Please enter a tex for encryption"
text = gets.chomp
puts caesar_cipher(text, 5)
