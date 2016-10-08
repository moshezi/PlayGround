class Book
    attr_accessor :title
    
    def title
        arr = @title.split
        arr.map do |i|
            if i != "and" && i != "in" && i != "of" && i != "the" && i != "a" && i != "an"
            i.capitalize!
            end
        end
        arr[0].capitalize!
        arr.join(" ")
    end
end


#another solution
=begin
class Book
    attr_accessor :title

    def title
        words = @title.split
        words.map do |word|
            not_capital = ["and", "in", "the", "of", "a", "an"]
            unless (not_capital.include? word)
                word.capitalize!
            end
        end
        words[0].capitalize!
        words.join(" ")
    end
end
=end
