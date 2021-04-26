class Enigma

  include Keyable
  include Offsetable
  include Codeable
  include Encryptable
  include Decryptable

  def create_code(date, key)
    @code = add_key_and_offset(date, key)
  end

  def create_code_decrypt(date, key)
    @code_decrypt = add_key_and_offset_decode(date, key)
  end

  def encrypt_methods(message, key, date)
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
  end

  def encrypt(message, key = random_full_key_string, date = date_to_num_string)
    encrypt_methods(message, key, date)

    encrypted = {
      :encryption => number_back_to_letter_joined(message),
      :key => key,
      :date => date
    }
  end

  def decrypt_methods(message, key, date)
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
  end

  def decrypt(message, key, date = date_to_num_string)
    decrypt_methods(message, key, date)

    decrypted = {
      :decryption => number_back_to_letter_joined_backwards(message),
      :key => key,
      :date => date
    }
  end
end
