class Enigma

  include Keyable
  include Offsetable
  include Codeable
  include Encryptable

  attr_reader :message,
              :key,
              :date

  def inititalize
    @message = message
    @key = key
    @date = date
  end

  def code(date = date_to_num_string, key = random_full_key_string)
    @code = add_key_and_offset(date, key)
  end

  def encrypt(message, key = random_full_key_string, date = date_to_num_string)
    random_full_key_array(key)
    random_full_key_split(key)
    random_full_key(key)
    date_to_num(date)
    square_date(date)
    find_offset(date)
    date_nums(date)
    build_key(key)
    build_offset(date)
    code(date, key)
    hash = {
      :encryption => number_back_to_letter_joined(message),
      :key => key,
      :date => date
    }
    # require'pry';binding.pry
  end
end
