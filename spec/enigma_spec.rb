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

  context 'enigma methods for encrypt and decrypt' do

    it 'can find code' do
      expect(enigma.create_code("040895", "02715")).to eq([3, 27, 73, 20])
    end

    it 'can find code decrypt' do
      expect(enigma.create_code_decrypt("040895", "02715")).to eq([3, 27, 73, 20])
    end

    it 'encrypt without a give key and date' do
      allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
      allow(Time).to receive(:now).and_return(Date.new(2021, 04, 24))

        expect = {
        encryption: "tfwf agicmo",
        key: "05347",
        date: "240421"
       }
      expect(enigma.encrypt("hello world")).to eq(expect)
    end

    it 'can encrypt' do

      expect = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }

      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expect)
    end

    it 'can decrypt' do

      expect = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }

      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expect)
    end

    it 'can decrypt without a date' do
      allow(enigma).to receive(:random)  {["2", "7", "1", "5"]}
      allow(Time).to receive(:now).and_return(Date.new(1995, 8, 4))

      encrypted = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }

      decrypted = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }

      expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(decrypted)
    end

    it 'can encrypt without a date' do
      allow(enigma).to receive(:random)  {["2", "7", "1", "5"]}
      allow(Time).to receive(:now).and_return(Date.new(1995, 8, 4))

      expect = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }

      expect(enigma.encrypt("hello world", "02715")).to eq(expect)
    end

  end

end
