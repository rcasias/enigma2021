require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'

RSpec.describe Enigma do

  enigma = Enigma.new

  it 'exists' do
    expect(enigma).to be_instance_of(Enigma)
  end

  context 'methods on alphabet roataion for encryption' do

    it 'populates an alphabet' do
      expect(enigma.alphabet.length).to eq(27)
      expect(enigma.alphabet[0]).to eq("a")
      expect(enigma.alphabet[26]).to eq(" ")
    end

    it 'can cycle letters' do
      allow(enigma).to receive(:code) {[12, 55, 38, 48]}
      expect(enigma.encryption_cycle("hello world!").class).to eq(Array)
      expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
      expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
      expect(enigma.encryption_cycle("A")[0][0]).to eq(0)
      expect(enigma.encryption_cycle("a")[0][0]).to eq(0)
    end

    it 'can create alphabet number hash' do
      expect(enigma.alphabet_numbers.class).to eq(Array)
    end

    it 'can read hash' do
      expect(enigma.alphabet_rotation.class).to eq(Hash)
    end

    it 'can cycle letters' do
      allow(enigma).to receive(:code) {[12, 55, 38, 48]}
      expect(enigma.alphabet_rotation_encrypt("hello world!")[0]).to eq(19)
      expect(enigma.alphabet_rotation_encrypt("hello world!")[-1]).to eq(-64)
      expect(enigma.alphabet_rotation_encrypt("hello world!").class).to eq(Array)
    end

    it 'can cange number back into letter' do
      allow(enigma).to receive(:code) {[12, 55, 38, 48]}
      expect(enigma.number_back_to_letter("hello world!")[0]).to eq("t")
      expect(enigma.number_back_to_letter("hello world!")[-1]).to eq("!")
    end

  end

end
