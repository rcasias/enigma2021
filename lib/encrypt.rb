require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'

class Encrypt

  enigma = Enigma.new

  attr_reader :file_read,
              :file_write,
              :date,
              :key,
              :message


  def initialize(file_read, file_write)
    @file_read = file_read
    @file_write = file_write
    @key = key
    @date = date
    @message = message
  end

  def generate_message_key_date
    file = File.open(@file_read)
    file_data = file.readlines.map(&:chomp)
  end

  def split_generated_combination
    split = generate_message_key_date.map do |element|
      element.split(",")
    end.flatten
  end

  def message_key_date
    @message = split_generated_combination[0]
    @key = split_generated_combination[1]
    @date = split_generated_combination[2]
  end

  encrypt = Encrypt.new('./text/message.txt', './text/read_message.txt')
  encrypt.generate_message_key_date
  encrypt.split_generated_combination
  encrypt.message_key_date
  @message = encrypt.message
  @key = encrypt.key
  if @key.nil?
    @key = enigma.random_full_key_string
  end
  @date = encrypt.date
  if @date.nil?
    @date = enigma.date_to_num_string
  end
  result = enigma.encrypt(@message, @key, @date)
  encrypted_message = result[:encryption]

  def write_to_file(file_write, message)
    file = File.open(@file_write, "w") { |f| f.write message }
  end

  encrypt.write_to_file('./text/read_message.txt', encrypted_message)
  p "Encryption key: #{@key}"
  p "Encryption date: #{@date}"
  p "Encryption wrote to: #{encrypt.file_write}"

end
