require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'
require './lib/encrypt'

RSpec.describe Encrypt do

  encryption = Encrypt.new('./text/encrypt_read.txt', './text/encrypt_write.txt')

  it 'exists' do
    expect(encryption).to be_instance_of(Encrypt)
  end

  it 'can read initialize' do
    expect(encryption.file_read).to eq("./text/encrypt_read.txt")
    expect(encryption.file_write).to eq('./text/encrypt_write.txt')
  end

  context 'methods' do

    it 'can generate message' do
      expect(encryption.generate_message_key_date).to eq(["hello world,02715,040895"])
    end

    it 'can split generaterated key and date' do
      expect(encryption.split_generated_combination).to eq(["hello world", "02715", "040895"])
    end

    it 'can split generaterated key and date into key and date' do
      expect(encryption.split_generated_combination[0]).to eq("hello world")
      expect(encryption.split_generated_combination[1]).to eq("02715")
      expect(encryption.split_generated_combination[2]).to eq("040895")
    end

  end

end
