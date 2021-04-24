require 'rspec'
require './lib/key'
require './lib/offset'
require './lib/encryptor_code'
require './lib/enigma'
require './lib/message_encryptable'

RSpec.describe MessageEncryptable do

  # it 'exists' do
  #   enigma = Enigma.new
  #
  #   expect(enigma).to be_instance_of(Enigma)
  # end

  it 'populates an alphabet' do
    enigma = Enigma.new

    expect(enigma.alphabet.length).to eq(27)
    expect(enigma.alphabet[0]).to eq("a")
    expect(enigma.alphabet[26]).to eq(" ")
  end

  it 'can cycle letters' do
    enigma = Enigma.new
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.encryption_cycle("hello world!").class).to eq(Array)
    expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
    expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
    expect(enigma.encryption_cycle("A")[0][0]).to eq(0)
    expect(enigma.encryption_cycle("a")[0][0]).to eq(0)
  end

  it 'can create alphabet number hash' do
    enigma = Enigma.new
    expect(enigma.alphabet_numbers.class).to eq(Array)
  end

  it 'can read hash' do
    enigma = Enigma.new
    expect(enigma.alphabet_rotation.class).to eq(Hash)
  end

  it 'can cycle letters' do
    enigma = Enigma.new
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.alphabet_rotation_encrypt("hello world!")[0]).to eq(19)
    expect(enigma.alphabet_rotation_encrypt("hello world!")[-1]).to eq(-64)
    expect(enigma.alphabet_rotation_encrypt("hello world!").class).to eq(Array)
  end

  it 'can cange number back into letter' do
    enigma = Enigma.new
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.number_back_to_letter("hello world!")[0]).to eq("t")
    expect(enigma.number_back_to_letter("hello world!")[-1]).to eq("!")
    expect(enigma.number_back_to_letter("hello world!").class).to eq(Array)
  end

end
