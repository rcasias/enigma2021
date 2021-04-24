# require 'rspec'
# require './lib/key'
#
# RSpec.describe Key do
#
#   it 'exists' do
#     key = Key.new
#
#     expect(key).to be_instance_of(Key)
#   end
#
#   it 'inititalize' do
#     key = Key.new
#
#     expect(key.full_key).to eq([])
#   end
#
#   it 'can generate random number' do
#     key = Key.new
#     allow(key).to receive(:random)  {["5", "3", "4", "7"]}
#
#     expect(key.random.length).to eq(4)
#     expect(key.random).to eq(["5", "3", "4", "7"])
#   end
#
#   it 'can make random number a string' do
#     key = Key.new
#     allow(key).to receive(:random)  {["5", "3", "4", "7"]}
#
#     expect(key.random_full_key_string).to eq('05347')
#   end
#
#   it 'can create pattern' do
#     key = Key.new
#     allow(key).to receive(:random)  {["5", "3", "4", "7"]}
#
#     expect(key.random_full_key_array).to eq(['0','5','5','3','3','4','4','7'])
#   end
#
#   it 'can split pattern' do
#     key = Key.new
#     allow(key).to receive(:random)  {["5", "3", "4", "7"]}
#
#     expect(key.random_full_key_split).to eq(['05', '53', '34', '47'])
#   end
#
#   it 'can generate a full key' do
#     key = Key.new
#     allow(key).to receive(:random) {["5", "3", "4", "7"]}
#
#     expect(key.random_full_key).to eq([5, 53, 34, 47])
#   end
#
# end
