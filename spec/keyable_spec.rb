require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/enigma'

RSpec.describe Enigma do

  enigma = Enigma.new

  context 'key methods' do
    it 'can generate random number' do
      allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
      expect(enigma.random.length).to eq(4)
      expect(enigma.random).to eq(["5", "3", "4", "7"])
    end

    it 'can make random number a string' do
      allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
      expect(enigma.random_full_key_string).to eq('05347')
    end

    it 'can create pattern' do
      allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
      expect(enigma.random_full_key_array).to eq(['0','5','5','3','3','4','4','7'])
    end

    it 'can split pattern' do
      allow(enigma).to receive(:random)  {["5", "3", "4", "7"]}
      expect(enigma.random_full_key_split).to eq(['05', '53', '34', '47'])
    end
    
  end

end
