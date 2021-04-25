require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'
# require './lib/encrypt'

class Decrypt

  enigma = Enigma.new

  attr_reader :filename,
              :date,
              :key,
              :message


  def initialize(filename)
    @filename = filename
    @key = key
    @date = date
    @message = message
  end

  def generate_key_date
    file = File.open(@filename)
    file_data = file.readlines.map(&:chomp)
  end

  def generate_message
    file = File.open(@filename)
    file_data = file.readlines.map(&:chomp)
    @message = file_data[0]
  end

  def split_generated_combination
    split = generate_key_date.map do |element|
      element.split(",")
    end.flatten
  end

  def key_and_date
    @key = split_generated_combination[0]
    @date = split_generated_combination[1]
  end

  decrypt = Decrypt.new('./text/decrypted.txt')
  decrypt_message = Decrypt.new('./text/message.txt')
  decrypt.generate_key_date
  decrypt.split_generated_combination
  decrypt.key_and_date
  @key = decrypt.key
  @date = decrypt.date
  if @date.nil?
    @date = enigma.date_to_num_string
  end
  @message = decrypt_message.generate_message
  # require'pry';binding.pry
  p enigma.decrypt(@message, @key, @date)

end
