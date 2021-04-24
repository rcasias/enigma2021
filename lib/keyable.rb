module Key

  def full_key
    @full_key = []
  end

  def random
    4.times.map{Random.rand(9).to_s}
  end

  def random_full_key_string
    random_string = random.join("")
    random_string.rjust(5,'0')
  end

  def random_full_key_array
    array = []
    random_full_key_string.each_char do |num|
      if array.empty?
        array << num
      elsif array.length == 7
          array << num
      else
        array << num
        array << num
      end
    end
    array
  end

  def random_full_key_split
    one = random_full_key_array.join
    one.scan(/../)
  end

  def random_full_key
    @full_key = random_full_key_split.map do |num|
      num.to_i
    end
  end
end
