require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'
require './lib/decrypt'

RSpec.describe Decrypt do

  decryption = Decrypt.new("./text/message.txt")
  decryption_key_date = Decrypt.new("./text/decrypted.txt")

  it 'exists' do
    expect(decryption).to be_instance_of(Decrypt)
  end

  it 'can read initialize' do
    expect(decryption.filename).to eq("./text/message.txt")
    expect(decryption_key_date.filename).to eq("./text/decrypted.txt")
  end

  context 'methods' do

    it 'can generate message' do
      expect(decryption.generate_message).to eq("keder ohulw")
    end

    it 'can generate key and date' do
      expect(decryption_key_date.generate_message).to eq("02715,040895")
    end

    it 'can split generaterated key and date' do
      expect(decryption_key_date.split_generated_combination).to eq(["02715", "040895"])
    end

    it 'can split generaterated key and date into key and date' do
      expect(decryption_key_date.split_generated_combination[0]).to eq("02715")
      expect(decryption_key_date.split_generated_combination[1]).to eq("040895")
    end
    
  end

end
