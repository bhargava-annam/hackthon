require 'rails_helper'

describe "Hacks Controller" do
    current_user = User.first_or_create!(email: 'bhargava1@gmail.com',username:'E01', password: 'password', password_confirmation: 'password')
    it "renders a successful Challenge" do
      challenge =  Hack.new(
        title: 'Hack',
        description: 'A Valid Body',
        user: current_user
      )
      challenge.save
      expect(response).to be_successful
    end

    
  end