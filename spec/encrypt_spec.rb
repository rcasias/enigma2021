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

  encryption = Encrypt.new("./text/message.txt")
  encryption_key_date = Encrypt.new("./text/encrypted.txt")

  it 'exists' do
    expect(encryption).to be_instance_of(Encrypt)
  end

  it 'can read initialize' do
    expect(encryption.filename).to eq("./text/message.txt")
    expect(encryption_key_date.filename).to eq("./text/encrypted.txt")
  end

  context 'methods' do

    it 'can generate message' do
      expect(encryption.generate_message).to eq("keder ohulw")
    end

    it 'can generate key and date' do
      expect(encryption_key_date.generate_message).to eq("02715,040895")
    end

    it 'can split generaterated key and date' do
      expect(encryption_key_date.split_generated_combination).to eq(["02715", "040895"])
    end

    it 'can split generaterated key and date into key and date' do
      expect(encryption_key_date.split_generated_combination[0]).to eq("02715")
      expect(encryption_key_date.split_generated_combination[1]).to eq("040895")
    end

  end

end
