class Enigma

  include Keyable
  include Offsetable
  include Codeable
  include Encryptable
  include Decryptable

  attr_reader :message,
              :key,
              :date,
              :code,
              :code_decrypt

  def inititalize
    @message = message
    @key = key
    @date = date
    @code = code
    @code_decrypt = code_decrypt
  end

  def create_code(date = date_to_num_string, key = random_full_key_string)
    @code = add_key_and_offset(date, key)
    # require'pry';binding.pry
  end

  def create_code_decrypt(date, key)
    @code_decrypt = add_key_and_offset_decode(date, key)
  end

  def encrypt(message, key = random_full_key_string, date = date_to_num_string)
    # require'pry';binding.pry
    random_full_key_array(key)
    random_full_key_split(key)
    random_full_key(key)
    date_to_num(date)
    square_date(date)
    find_offset(date)
    date_nums(date)
    build_key(key)
    build_offset(date)
    create_code(date, key)
    hash = {
      :encryption => number_back_to_letter_joined(message),
      :key => key,
      :date => date
    }
  end

  def decrypt(message, key, date)
    random_full_key_array(key)
    random_full_key_split(key)
    random_full_key(key)
    date_to_num(date)
    square_date(date)
    find_offset(date)
    date_nums(date)
    build_key(key)
    build_offset(date)
    create_code_decrypt(date, key)
    hash = {
      :decryption => number_back_to_letter_joined_backwards(message),
      :key => key,
      :date => date
    }
  end
end
