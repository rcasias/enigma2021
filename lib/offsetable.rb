module Offsetable

  def find_date
    Time.now.strftime("%d/%m/%y")
  end

  def date_to_num_string
    date_without_dash = find_date.split("/")
    date_joined = date_without_dash.join
  end

  def date_to_num (date = date_to_num_string)
    date.to_i
  end

  def square_date(date = date_to_num_string)
    (date_to_num(date)**2)
  end

  def find_offset(date = date_to_num_string)
    num_to_string = square_date(date).to_s
    last_four = num_to_string[-4..-1]
    last_four.to_i
  end

  def date_nums(date = date_to_num_string)
    @full_offset = find_offset(date).to_s.chars.map do |digit|
      digit.to_i
    end  
  end

end
