module Codeable
  include Keyable
  include Offsetable

  attr_reader :code

  def inititalize
    @code = code
  end

  def build_key(key = random_full_key_string)
    random_full_key(key)
  end

  def build_offset(date = date_to_num_string)
    date_nums(date)
  end

  def add_key_and_offset(date = date_to_num_string, key = random_full_key_string)
    numbers = build_key(key).zip(build_offset(date))
    @code = numbers.map do |num|
      num[0] + num[1]
    end
  end

end
