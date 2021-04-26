require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/enigma'
require './lib/decryptable'
require './lib/encryptable'

RSpec.describe Enigma do

  enigma = Enigma.new

  context 'methods on alphabet roataion for decryption' do

    it 'populates an alphabet' do
      expect(enigma.alphabet.length).to eq(27)
      expect(enigma.alphabet[0]).to eq("a")
      expect(enigma.alphabet[26]).to eq(" ")
    end

    it 'can cycle letters' do
      allow(enigma).to receive(:code_decrypt) {[12, 55, 38, 48]}
      expect(enigma.decryption_cycle("hello world!").class).to eq(Array)
      expect(enigma.decryption_cycle("hello world")[0]).to eq([7, 12])
      expect(enigma.decryption_cycle("hello world")[0]).to eq([7, 12])
      expect(enigma.decryption_cycle("A")[0][0]).to eq(0)
      expect(enigma.decryption_cycle("a")[0][0]).to eq(0)
    end

    it 'can create alphabet number hash' do
      expect(enigma.alphabet_numbers.class).to eq(Array)
    end

    it 'can read hash' do
      expect(enigma.alphabet_rotation.class).to eq(Hash)
    end

    it 'can cycle letters' do
      allow(enigma).to receive(:code_decrypt) {[12, 55, 38, 48]}
      expect(enigma.alphabet_rotation_decrypt("hello world!")[0]).to eq(22)
      expect(enigma.alphabet_rotation_decrypt("hello world!")[-1]).to eq(-64)
      expect(enigma.alphabet_rotation_decrypt("hello world!").class).to eq(Array)
    end

    it 'can cange number back into letter' do
      allow(enigma).to receive(:code_decrypt) {[12, 55, 38, 48]}
      expect(enigma.number_back_to_letter_joined_backwards("tfwf agicmo!")[0]).to eq("h")
      expect(enigma.number_back_to_letter_joined_backwards("tfwf agicmo!")[-1]).to eq("!")
      expect(enigma.number_back_to_letter_joined_backwards("tfwf agicmo!").class).to eq(String)
    end

  end

end
