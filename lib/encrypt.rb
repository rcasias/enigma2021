require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'
require './lib/encrypt'

class Encrypt
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
    end
    # require'pry';binding.pry
  end

  def key_and_date
    split_generated_combination.map do |combination|
      @key = combination[0]
      @date = combination[1]
    end
  end

  encrypt = Encrypt.new('./text/encrypted.txt')
  encrypt_message = Encrypt.new('./text/message.txt')
  encrypt.generate_key_date
  encrypt.split_generated_combination
  encrypt.key_and_date
  @key = encrypt.key
  @date = encrypt.date
  @message = encrypt_message.generate_message
  require'pry';binding.pry
  enigma = Enigma.new
  p enigma.encrypt(@message, @key, @date)

end
