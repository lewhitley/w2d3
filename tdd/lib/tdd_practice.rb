def my_uniq(array)
  raise ArgumentError unless array.is_a?(Array)
  result = []
  array.each do |el|
    result << el unless result.include?(el)
  end
  result
end

class Array
  def two_sum
    result = []

    self.each_with_index do |el1, idx1|
      idx2 = idx1 + 1
      until idx2 == self.length
        result << [idx1, idx2] if el1 + self[idx2] == 0
        idx2 += 1
      end
    end

    result
  end
end

def my_transpose(array)
  transposed = []

  array.each_with_index do |arr1, idx1|
    row = []
    arr1.each_with_index do |el, idx2|
      row << array[idx2][idx1]
    end
    transposed << row
  end

  transposed
end

def my_stock_picker(array)
  day_pair = []
  difference = 0
  array.each_with_index do |el1, i1|
    i2 = i1 + 1
    until i2 == array.length
      day_pair = [i1, i2] if array[i2] - el1 > difference
      i2 += 1
    end
  end
  day_pair
end
