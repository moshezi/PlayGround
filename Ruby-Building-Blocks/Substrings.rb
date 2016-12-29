def substrings (string, arr)
  result = {}    #empty hash

  arr.each do |word|
    arr_of_counts = string.downcase.scan(word)   #Running the scan method on a string and getting back an array including all the times that string was found in that string
    count = arr_of_counts.count                  #The count method counts the number of elements in the array

    if count > 0
      result[word] = count
    end
  end
    return result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
