def sum_odd_indexed(array)
  sum = 0
  array.each_with_index { |num, index| sum += num if index.odd? }
  sum
end

def even_numbers(array)
  array.select { |num| num.even? }
end

def short_words(array, max_length)
  array.reject { |word| word.size > max_length }
end

def first_under(array, limit)
  array.find { |num| num < limit }
end

def add_bang(array)
  array.map { |word| word + "!" }
end

def concatenate(array)
  array.reduce("") { |a, e| a + e }
end

def sorted_pairs(array)
  result = []
  array.each_slice(2) do |slice|
    result << slice.sort
  end
  result
end


# hash exercise 

letters = {"c" => 3, "e" => 1, "l" => 1, "n" => 1, "t" => 1, "x" => 8, "y" => 4}

score = 0

"excellently".each_char {|letter| score += letters[letter] }

point_totals = Hash.new(0)

"excellently".each_char {|letter| point_totals[letter] += letters[letter] }

point_totals.values.reduce(0, :+)

# custom iterators

# yield usage

def n_times n
  1.upto(n) do |count|
    yield count
  end
end



n_times(8) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end


# it should print something like this

# 1 situps
# 1 pushups
# 1 chinups
# ...
# 5 situps
# 5 pushups
# 5 chinups
