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

  def code
    @code = add_key_and_offset
  end

  def encrypt(message, key = random_full_key_string, date = date_to_num_string)
    hash = {
      :encryption => number_back_to_letter_joined(message),
      :key => key,
      :date => date
    }
    require'pry';binding.pry
  end
end
