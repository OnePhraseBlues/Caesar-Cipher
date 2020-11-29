def convert_letter(letter, shift_factor)
  alphabet_hash = {
  a: 0,
  b: 1,
  c: 2,
  d: 3,
  e: 4,
  f: 5,
  g: 6,
  h: 7,
  i: 8,
  j: 9,
  k: 10,
  l: 11,
  m: 12,
  n: 13,
  o: 14,
  p: 15,
  q: 16,
  r: 17,
  s: 18,
  t: 19,
  u: 20,
  v: 21,
  w: 22,
  x: 23,
  y: 24,
  z: 25,
}
  return letter unless alphabet_hash.has_key?(letter.downcase.to_sym) #will instantly return symbols and whitespaces
  old_letter_value = alphabet_hash.fetch(letter.downcase.to_sym) 

  until old_letter_value - shift_factor >= 0 && old_letter_value - shift_factor <= 25 do #allows wrapping from z to a.
    old_letter_value += 26 #loops if shift_factor is an absurd number
  end

  new_letter_value = old_letter_value - shift_factor
  new_letter = alphabet_hash.keys[new_letter_value].to_s
  #should return an array to new_letter. just need the 0 index since values are also unique

  return letter == letter.downcase ? new_letter : new_letter.upcase #simple check for lower/upper case
end

def caesar_cipher(input_string, shift_factor)
  old_string_array = input_string.split("")
  new_string_array = old_string_array.map {|element| convert_letter(element, shift_factor)}
  new_string = new_string_array.join
  return new_string
end

puts "Enter your message you would like to encrypt: "
user_string = gets
puts "How many letters would you like to shift? (Shifts to the left. Positive integers only)"
user_shift = gets.chomp.to_i
until user_shift.integer? && user_shift.positive?
  puts "Invalid entry. Please try again: "
  user_shift = gets.chomp.to_i
end
puts "Here is your encrypted message:"
puts caesar_cipher(user_string, user_shift)
