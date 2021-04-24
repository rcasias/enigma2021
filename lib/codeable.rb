module Codeable
  include Keyable
  include Offsetable

  attr_reader :code

  def inititalize
    @code = code
  end

  def build_key
    random_full_key
  end

  def build_offset
    date_nums
  end

  def add_key_and_offset
    numbers = build_key.zip(build_offset)
    @code = numbers.map do |num|
      num[0] + num[1]
    end
  end

end
