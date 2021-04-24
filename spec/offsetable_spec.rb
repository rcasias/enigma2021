# require 'rspec'
# require './lib/key'
# require './lib/offset'
#
# RSpec.describe Offset do
#
#   it 'exists' do
#     offset = Offset.new
#
#     expect(offset).to be_instance_of(Offset)
#   end
#
#   it 'inititalize' do
#     offset = Offset.new
#
#     expect(offset.full_offset).to eq([])
#   end
#
#   it 'can find date' do
#     offset = Offset.new
#     allow(offset).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#     expect(offset.find_date).to eq("24/04/21")
#   end
#
#   it 'can turn date into a num' do
#     offset = Offset.new
#     allow(offset).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#     expect(offset.date_to_num).to eq(240421)
#   end
#
#   it 'can turn date into a num' do
#     offset = Offset.new
#     allow(offset).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#       expect(offset.square_date).to eq(57802257241)
#   end
#
#   it 'can pick last four numbers of squared' do
#     offset = Offset.new
#     allow(offset).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#     expect(offset.find_offset).to eq(7241)
#   end
#
#   it 'can pick push four didgets into offset array' do
#     offset = Offset.new
#     allow(offset).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#     expect(offset.date_nums).to eq([7,2,4,1])
#   end
#
# end
