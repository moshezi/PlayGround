def echo(x)
   return x
end

def shout(x)
    return x.upcase
end

def repeat(x, y = 2)
  phrase_to_repeat = x
    (y-1).times { phrase_to_repeat += " " + x}
  return phrase_to_repeat
end

def start_of_word(word, num)
    word[0..num-1]
end

def first_word(sentence)
    arr = sentence.split
    arr[0]
end

#another option
def first_word(sentence)
    first_word = ""
    counter = 0
    while counter < sentence.length do
        if sentence[counter] == " "
            break
        else 
            first_word += sentence[counter]
        end
        counter += 1
    end
    first_word
end

def titleize(words)
    arr = words.split
    arr.each do |word|
        if (word != "and" && word != "the" && word != "over")
            word.capitalize!
        end
    end
    arr[0].capitalize!
    arr.join(" ")
end
