module Encryptable

  include Keyable
  include Offsetable
  include Codeable

  def alphabet
    ("a".."z").to_a << " "
  end

  def encryption_cycle(message)
    letter_array = []
    message.downcase.each_char do |letter|
    	if letter == " "
    	  letter_array << 26
      elsif
        letter_array << (letter.ord - 97)
      end
    end
    letter_array.zip(@code.cycle)
    # require'pry';binding.pry
  end

  def alphabet_numbers
    alphabet_number_array = []
    alphabet.each do |letter|
      if letter == " "
    	  alphabet_number_array << 26
      else
        alphabet_number_array << (letter.ord - 97)
      end
    end
    alphabet_number_array
  end

  def alphabet_rotation
    counter = -1
    ah = alphabet.each_with_object({}) do |letter, hash|
      hash[letter] = counter += 1
    end
  end

  def alphabet_rotation_encrypt(message)
   new_alphabet = []
   encryption_cycle(message).each do |num|
     if num[0] >= 0 &&  num[0] <= 26
       new_alphabet << alphabet_numbers.rotate(num[0]).rotate(num[1])[0]
     else
       new_alphabet << num[0]
     end
   end
   new_alphabet
 end

 def number_back_to_letter(message)
   new_letters = []
   alphabet_rotation_encrypt(message).each do |num|
     if num >= 0 && num <= 26
       new_letters << alphabet_rotation.key(num)
     else
       new_letters << ((num) + (97)).chr
     end
   end
   new_letters
 end

 def number_back_to_letter_joined(message)
   number_back_to_letter(message).join
 end

end
