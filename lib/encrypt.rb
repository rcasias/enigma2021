require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'
# require './lib/encrypt'

class Encrypt

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

  encrypt = Encrypt.new('./text/encrypted.txt')
  encrypt_message = Encrypt.new('./text/message.txt')
  encrypt.generate_key_date
  encrypt.split_generated_combination
  encrypt.key_and_date
  @key = encrypt.key
  if @key.nil?
    @key = enigma.random_full_key_string
  end
  @date = encrypt.date
  if @date.nil?
    @date = enigma.date_to_num_string
  end
  @message = encrypt_message.generate_message
  p enigma.encrypt(@message, @key, @date)

end
