require 'rails_helper'

RSpec.describe Hack, type: :model do
context 'validation tests' do
  current_user = User.first_or_create!(email: 'example@gmail.com',username:'E01', password: 'password', password_confirmation: 'password')

  it 'ensures it has a title ' do
    post = Hack.new(
      title: 'Hack',
      description: 'A Valid Body',
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = 'Has a title'
    expect(post).to be_valid
  end

  it 'ensures it has a body' do
    post = Hack.new(
      title: 'A Valid Title',
      description: '',
      user: current_user
    )
    expect(post).to_not be_valid

    post.description = 'Has a title'
    expect(post).to be_valid
  end

  it 'has a title of length in between 4-10 characters long' do
    post = Hack.new(
      title: '123456',
      description: 'A Valid Body',
      user: current_user )
      expect(post.title.length).to be_between(4,10).inclusive 
  end

  it 'has a description of length in between 5-15 characters' do
    post = Hack.new(
      title: '1234',
      description: '123456',
      user: current_user
    )
    expect(post.description.length).to be_between(5,15).inclusive

  end

end
end
