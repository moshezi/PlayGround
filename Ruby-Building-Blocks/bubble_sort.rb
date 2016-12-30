def bubble_sort array
  loop do                 #start loop
    swapped = false       #flag
    (array.length-1).times do |i|   #iterate 5 times each time
      if array[i] > array[ i+1 ]
        array[i], array[ i+1 ] = array[ i+1 ], array[i]  #swapp
        swapped = true
      end
    end
    break if swapped == false    #if flag is flase that means the array is sorted
  end
  return array
end

def bubble_sort_by array
  loop do
    swapped = false
    (array.length-1).times do |i|
      x = yield(array[i], array[ i + 1 ])
        if x == 1
          array[i], array[ i +1 ] = array[ i +1 ], array[i]
          swapped = true
        end
      end
      break if swapped == false
    end
    return array
  end


my_num = [4,3,78,2,0,2]
puts bubble_sort my_num

my_num2 = ["hi","hello","hey"]
arr = bubble_sort_by (my_num2) { |left,right| left.length <=> right.length }
puts arr
