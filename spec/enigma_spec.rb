require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/codeable'
require './lib/encryptable'
require './lib/decryptable'
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_instance_of(Enigma)
  end



  it 'can find code' do
    enigma = Enigma.new
    message = "hello world"
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}

    expect(enigma.code("040895", "02715")).to eq([3, 27, 73, 20])
  end

  it 'can find code' do
    enigma = Enigma.new
    message = "hello world"
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}

    expect(enigma.code_decrypt("040895", "02715")).to eq([3, 27, 73, 20])
  end

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

  it 'decrypt' do
    enigma = Enigma.new

    expect = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
    }

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expect)
  end

end
