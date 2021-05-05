# require 'rails_helper'
# RSpec.describe 'hacks/index', type: :view do
#     current_user = User.first_or_create!(email: 'example@gmail.com',username:'E01', password: 'password', password_confirmation: 'password')
#     before(:each) do
#         assign(:hacks, [
#             Hack.create!(
#                 title: '123456',
#                 description: '123456',
#                 user: current_user
#             ),
#             Hack.create!(
#                 title: '654321',
#                 description: '654321',
#                 user: current_user
#             )
#         ])
#     end

#     it 'renders a list of hacks ' do
#         render
#         assert_select 'tr>td', text: '123456'.to_s, count: 2
#         assert_select 'tr>td', text: '654321'.to_s, count: 2
#         assert_select 'tr>td', text: current_user.id.to_s, count: 2
#     end
# end


# require "spec_helper"

# RSpec.describe "hacks/index" do
# current_user = User.first_or_create!(email: 'bhargava1@gmail.com',username:'E01', password: 'password', password_confirmation: 'password')
# @hack = current_user.hacks.build
#   it "displays all the hacks" do
#     assign(:hacks, [
#         Hack.create!(:title => "slicer", :description => "123456", :user => current_user ),
#         Hack.create!(:title=> "dicers", :description => "123456", :user => current_user )
#     ])

#     render
#     rendered.should contain("slicer")
#     rendered.should contain("dicers")
#   end
# end