module Decryptable

  include Keyable
  include Offsetable
  include Codeable
  include Encryptable

  def alphabet
    ("a".."z").to_a << " "
  end

  def decryption_cycle(message)
    letter_array = []
    message.downcase.each_char do |letter|
    	if letter == " "
    	  letter_array << 26
      elsif
        letter_array << (letter.ord - 97)
      end
    end
    letter_array.zip(@code_decrypt.cycle)
  end

  def alphabet_rotation_decrypt(message)
   new_alphabet = []
   decryption_cycle(message).each do |num|
     if num[0] >= 0 &&  num[0] <= 26
       new_alphabet << alphabet_numbers.rotate(num[0]).rotate(-num[1])[0]
     else
       new_alphabet << num[0]
     end
   end
   new_alphabet
 end

 def number_back_to_letter_decrypt(message)
   new_letters = []
   alphabet_rotation_decrypt(message).each do |num|
     if num >= 0 && num <= 26
       new_letters << alphabet_rotation.key(num)
     else
       new_letters << ((num) + (97)).chr
     end
   end
   new_letters
 end

 def number_back_to_letter_joined_backwards(message)
   number_back_to_letter_decrypt(message).join
 end

end