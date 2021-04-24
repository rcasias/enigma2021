module Offsetable

  def full_offset
    @full_offset = []
  end

  def find_date
    a = Time.now.strftime("%d/%m/%y")
  end

  def date_to_num_string
    date_without_dash = find_date.split("/")
    date_joined = date_without_dash.join
  end

  def date_to_num
    date_to_num_string.to_i
  end

  def square_date
    (date_to_num**2)
  end

  def find_offset
    num_to_string = square_date.to_s
    last_four = num_to_string[-4..-1]
    last_four.to_i
  end

  def date_nums
    @full_offset = find_offset.to_s.chars.map { |digit| digit.to_i }
  end
end
