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

  it 'can build a key' do
    enigma = Enigma.new
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    expect(enigma.build_key).to eq([5, 53, 34, 47])
  end

  it 'can build an offset' do
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.build_offset).to eq([7,2,4,1])
  end

  it 'can build a unique code' do
    allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.add_key_and_offset_decode).to eq([12, 55, 38, 48])
  end

end
