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
    letter_array.zip(code_decrypt.cycle)
  end

  def alphabet_rotation_decrypt(message)
   decryption_cycle(message).map do |num|
     if num[0] >= 0 &&  num[0] <= 26
       alphabet_numbers.rotate(num[0]).rotate(-num[1])[0]
     else
       num[0]
     end
   end
 end

 def number_back_to_letter_decrypt(message)
   alphabet_rotation_decrypt(message).map do |num|
     if num >= 0 && num <= 26
       alphabet_rotation.key(num)
     else
       ((num) + (97)).chr
     end
   end
 end

 def number_back_to_letter_joined_backwards(message)
   number_back_to_letter_decrypt(message).join
 end

end
