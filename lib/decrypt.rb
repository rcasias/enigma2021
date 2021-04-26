require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'

class Decrypt

  enigma = Enigma.new

  attr_reader :file_read,
              :file_write,
              :date_read,
              :key_read,
              :date,
              :key,
              :message


  def initialize(file_read, file_write, date_read, key_read)
    @file_read = file_read
    @file_write = file_write
    @date_read = date_read
    @key_read = key_read
    @key = key
    @date = date
    @message = message
  end

  def generate_message
    file = File.open(@file_read)
    file_data = file.readlines.map(&:chomp)
    @message = file_data[0]
  end

  def generate_key
    file = File.open(@key_read)
    file_data = file.readlines.map(&:chomp)
    @key = file_data[0]
  end

  def generate_date
    file = File.open(@date_read)
    file_data = file.readlines.map(&:chomp)
    @date = file_data[0]
  end

  decrypt = Decrypt.new('./text/decrypt_read.txt', './text/decrypt_write.txt', './text/decrypt_date.txt', './text/decrypt_key.txt')
  decrypt.generate_message
  decrypt.generate_key
  decrypt.generate_date
  @key = decrypt.key
  @date = decrypt.date
  if @date == ""
    @date = enigma.date_to_num_string
  end
  @message = decrypt.message
  result = enigma.decrypt(@message, @key, @date)
  decrypted_message = result[:decryption]

  def write_to_file(file_write, message)
    file = File.open(@file_write, "w") { |f| f.write message }
  end

  decrypt.write_to_file('./text/decrypt_write.txt', decrypted_message)

  p "Decryption key: #{@key}"
  p "Decryption date: #{@date}"
  p "Decryption wrote to: #{decrypt.file_write}"

end
