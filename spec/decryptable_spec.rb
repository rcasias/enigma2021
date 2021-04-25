require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/enigma'
require './lib/decryptable'
require './lib/encryptable'

RSpec.describe Enigma do

  enigma = Enigma.new

  it 'populates an alphabet' do
    expect(enigma.alphabet.length).to eq(27)
    expect(enigma.alphabet[0]).to eq("a")
    expect(enigma.alphabet[26]).to eq(" ")
  end

  # it 'can cycle letters' do
  #   enigma = Decodeable.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.decryption_cycle("hello world!").class).to eq(Array)
  #   expect(enigma.decryption_cycle("hello world")[0]).to eq([7, 12])
  #   expect(enigma.decryption_cycle("hello world")[0]).to eq([7, 12])
  #   expect(enigma.decryption_cycle("A")[0][0]).to eq(0)
  #   expect(enigma.decryption_cycle("a")[0][0]).to eq(0)
  # end

  it 'can create alphabet number hash' do
    expect(enigma.alphabet_numbers.class).to eq(Array)
  end

  it 'can read hash' do
    expect(enigma.alphabet_rotation.class).to eq(Hash)
  end

  # it 'can cycle letters' do
  #   enigma = Decodeable.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.alphabet_rotation_encrypt("hello world!")[0]).to eq(19)
  #   expect(enigma.alphabet_rotation_encrypt("hello world!")[-1]).to eq(-64)
  #   expect(enigma.alphabet_rotation_encrypt("hello world!").class).to eq(Array)
  # end
  #
  # it 'can cange number back into letter' do
  #   enigma = Decodeable.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.number_back_to_letter("hello world!")[0]).to eq("t")
  #   expect(enigma.number_back_to_letter("hello world!")[-1]).to eq("!")
  #   expect(enigma.number_back_to_letter("hello world!").class).to eq(Array)
  # end

end
