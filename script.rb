# Opening file and treating it as a String
file = File.open("book.txt")
file_data = file.read.downcase

# Removing symbols (Cleaning TXT) & adding words into an array to operate
file_data.gsub!(/[^a-z]/, ' ')
array = file_data.split(" ")

# Creating a hash to store the different words and number of times it is repeated.
words_hash = Hash.new(0)
array.each do |v|
  words_hash[v] += 1
end

# Times each of the words is repeated
puts 'Times each word is repeated'
puts words_hash
# Number of different words
puts "#{words_hash.values.count} different words"

#################

# Words to understand 80% of the words written in the book
num_words = (words_hash.values.sum * 0.8).round()
puts "#{words_hash.values.sum} total words"
puts "#{num_words} words (80% of total)"
# Counter to acumulate the words till we reach the desired number and Hash to store the words
count = 0
new_hash = Hash.new
# Sorted the hash to start with the words with more words
sorted_array = words_hash.sort_by {|k,v| v}.reverse
# Iterating over the sorted_array until the count is equal to the number of words we need.
sorted_array.each do |k, v|
    count += v
    new_hash[k] = v
    break if count >= num_words
end

# Number of words to understand the 80% of the book
puts "#{new_hash.values.count} words to understand 80% of the book"
