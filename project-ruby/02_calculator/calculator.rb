def add(num1, num2)
    num1 + num2
end

def subtract(num1, num2)
    num1 - num2
end

def sum(arr)
    x = 0
    arr.each do |i|
        x += i
    end
    x
end

def multiply(num1, num2, *args)
    mul = num1 * num2
    args.each { |i| mul *= i }
    return mul
end

def power(num1, num2)
    num1 ** num2
end

def factorial(num)
    if num == 0
        return 1
    elsif num >=1
        counter = 1
        for i in 1..num
            counter *= i
        end
        return counter
    end
end