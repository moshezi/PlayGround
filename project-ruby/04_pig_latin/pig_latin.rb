def is_vowel(letter)
    letter == "a" || letter == "e" || letter == "i" ||
    letter == "o" || letter == "u"
end


def translate(word)
  x = word.split
    x.map! do |i|
        i = i.split("")
        until is_vowel(i[0])
        first_shift = i.shift
         i << first_shift
            if first_shift == "q" && i[0] == "u"
                second_shift = i.shift
                i << second_shift
            end
        end
         i << "ay"
         i.join
    end
    x.join(" ")
end