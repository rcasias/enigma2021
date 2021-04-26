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

  decrypt = Decrypt.new('./text/decrypt_read.txt', './text/decrypt_write.txt', './text/decrypt_date.txt', './text/decrypt_key.txt')

  it 'exists' do
    expect(decrypt).to be_instance_of(Decrypt)
  end

  it 'can read initialize' do
    expect(decrypt.file_read).to eq('./text/decrypt_read.txt')
    expect(decrypt.file_write).to eq('./text/decrypt_write.txt')
    expect(decrypt.date_read).to eq('./text/decrypt_date.txt')
    expect(decrypt.key_read).to eq('./text/decrypt_key.txt')
  end

  context 'methods' do

    it 'can generate message' do
      expect(decrypt.generate_message).to eq("keder ohulw")
    end

    it 'can generate date' do
      expect(decrypt.generate_date).to eq("040895")
    end

    it 'can generate key' do
      expect(decrypt.generate_key).to eq("02715")
    end

  end

end
