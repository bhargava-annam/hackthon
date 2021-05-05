require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures Employee Id presence' do
      user = User.new(email: 'example@gmail.com', password:'123456', password_confirmation:'123456').save
      expect(user).to eq(false)
    end

    it 'ensures Mail Id presence' do
      user = User.new(username: 'ID', password:'123456', password_confirmation:'123456').save
      expect(user).to eq(false)
    end
    
  end 

  context 'scope tests' do
    
  end
end
