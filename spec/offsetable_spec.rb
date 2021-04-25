require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keyable'
require './lib/offsetable'
require './lib/enigma'

RSpec.describe Enigma do

  enigma = Enigma.new
  # @fake_time = Date.today.prev_day
  # # Time.stub(:now) { @fake_time }
  # allow(enigma).to receive(Time.stub(:now)) {"23/04/21"}

  it 'inititalize' do
    expect(enigma.full_offset).to eq([])
  end

  it 'can find date' do
    @fake_time = Time.new(2021, 04, 24)
    Time.stub(:now) { @fake_time }
    expect(enigma.find_date).to eq("24/04/21")
  end

  it 'can turn date into a num' do
    @fake_time = Time.new(2021, 04, 24)
    Time.stub(:now) { @fake_time }
    expect(enigma.date_to_num).to eq(240421)
  end

  it 'can turn date into a num' do
    @fake_time = Time.new(2021, 04, 24)
    Time.stub(:now) { @fake_time }
    # allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.square_date).to eq(57802257241)
  end

  it 'can pick last four numbers of squared' do
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.find_offset).to eq(7241)
  end

  it 'can pick push four didgets into offset array' do
    allow(enigma).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
    expect(enigma.date_nums).to eq([7,2,4,1])
  end

end
