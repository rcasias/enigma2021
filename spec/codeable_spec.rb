# require 'rspec'
# require './lib/key'
# require './lib/offset'
# require './lib/encryptor_code'
#
# RSpec.describe EncryptorCode do
#
#   it 'exists' do
#     encryptor_code = EncryptorCode.new
#
#     expect(encryptor_code).to be_instance_of(EncryptorCode)
#   end
#
#   it 'can build a key' do
#     encryptor_code = EncryptorCode.new
#     allow(encryptor_code).to receive(:random)  {["5", "3", "4", "7"]}
#
#
#     expect(encryptor_code.build_key).to eq([5, 53, 34, 47])
#   end
#
#   it 'can build an offset' do
#     encryptor_code = EncryptorCode.new
#     allow(encryptor_code).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#     expect(encryptor_code.build_offset).to eq([7,2,4,1])
#   end
#
#   it 'can build a unique code' do
#     encryptor_code = EncryptorCode.new
#     allow(encryptor_code).to receive(:random)  {["5", "3", "4", "7"]}
#     allow(encryptor_code).to receive(Time.now.strftime("%d/%m/%y")) {"23/04/21"}
#
#     expect(encryptor_code.add_key_and_offset).to eq([12, 55, 38, 48])
#   end
#
# end
