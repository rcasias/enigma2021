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
    letter_array.zip(code.cycle)
  end

  def alphabet_numbers
    alphabet.map do |letter|
      if letter == " "
    	  26
      else
        letter.ord - 97
      end
    end
  end

  def alphabet_rotation
    counter = -1
    ah = alphabet.each_with_object({}) do |letter, hash|
      hash[letter] = counter += 1
    end
  end

  def alphabet_rotation_encrypt(message)
   encryption_cycle(message).map do |num|
     if num[0] >= 0 &&  num[0] <= 26
       alphabet_numbers.rotate(num[0]).rotate(num[1])[0]
     else
       num[0]
     end
   end
 end

 def number_back_to_letter(message)
   alphabet_rotation_encrypt(message).map do |num|
     if num >= 0 && num <= 26
       alphabet_rotation.key(num)
     else
       ((num) + (97)).chr
     end
   end
 end

 def number_back_to_letter_joined(message)
   number_back_to_letter(message).join
 end

end
