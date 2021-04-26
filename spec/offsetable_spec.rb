require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/enigma'

RSpec.describe Enigma do

  enigma = Enigma.new

  it 'can find date' do
    allow(Time).to receive(:now).and_return(Date.new(2021, 04, 24))
    expect(enigma.find_date).to eq("24/04/21")
  end

  it 'can turn date into a num' do
    allow(Time).to receive(:now).and_return(Date.new(2021, 04, 24))
    expect(enigma.date_to_num).to eq(240421)
  end

  it 'can turn date into a num' do
    allow(Time).to receive(:now).and_return(Date.new(2021, 04, 24))
    expect(enigma.square_date).to eq(57802257241)
  end

  it 'can pick last four numbers of squared' do
    expect(enigma.find_offset).to eq(7241)
  end

  it 'can pick push four didgets into offset array' do
    expect(enigma.date_nums).to eq([7,2,4,1])
  end

end
