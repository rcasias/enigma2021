require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_instance_of(Enigma)
  end

  # it 'populates an alphabet' do
  #   enigma = Enigma.new
  #
  #   expect(enigma.alphabet.length).to eq(27)
  #   expect(enigma.alphabet[0]).to eq("a")
  #   expect(enigma.alphabet[26]).to eq(" ")
  # end

  it 'can finde code' do
    enigma = Enigma.new
    message = "hello world"
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}

    expect(enigma.code).to eq([12, 55, 38, 48])
  end

  # it 'can cycle letters' do
  #   enigma = Enigma.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.encryption_cycle("hello world!").class).to eq(Array)
  #   expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
  #   expect(enigma.encryption_cycle("hello world")[0]).to eq([7, 12])
  #   expect(enigma.encryption_cycle("A")[0][0]).to eq(0)
  #   expect(enigma.encryption_cycle("a")[0][0]).to eq(0)
  # end
  #
  # it 'can create alphabet number hash' do
  #   enigma = Enigma.new
  #   expect(enigma.alphabet_numbers.class).to eq(Array)
  # end
  #
  # it 'can read hash' do
  #   enigma = Enigma.new
  #   expect(enigma.alphabet_rotation.class).to eq(Hash)
  # end
  #
  # it 'can cycle letters' do
  #   enigma = Enigma.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.alphabet_rotation_encrypt("hello world!")[0]).to eq(19)
  #   expect(enigma.alphabet_rotation_encrypt("hello world!")[-1]).to eq(-64)
  #   expect(enigma.alphabet_rotation_encrypt("hello world!").class).to eq(Array)
  # end
  #
  # it 'can cange number back into letter' do
  #   enigma = Enigma.new
  #   allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
  #   allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
  #   expect(enigma.number_back_to_letter("hello world!")[0]).to eq("t")
  #   expect(enigma.number_back_to_letter("hello world!")[-1]).to eq("!")
  #   expect(enigma.number_back_to_letter("hello world!").class).to eq(Array)
  # end


  it 'encrypt without a give key and date' do
    enigma = Enigma.new
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(:date) {"24/04/21"}

      expect = {
      encryption: "tfwf agicmo",
      key: "05347",
      date: "240421"
     }
    expect(enigma.encrypt("hello world")).to eq(expect)
  end

  it 'encrypt' do
    enigma = Enigma.new

    expect = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expect)
  end
end
