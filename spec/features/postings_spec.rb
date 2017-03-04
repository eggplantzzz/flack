# require 'rails_helper'
#
# RSpec.feature "Postings", type: :feature do
#   context 'forum view' do
#     Steps 'going to the forum view' do
#       Given 'that I am on the home page' do
#         visit '/'
#       end
#       And 'I go to the registration page' do
#         click_link 'Sign up'
#         expect(page).to have_content "Password"
#       end
#       Then 'I can register a new user' do
#         fill_in 'Email', with: '2345@2345.com'
#         fill_in 'Password', with: '67896789'
#         fill_in 'Password confirmation', with: '67896789'
#         click_button 'Sign up'
#         expect(page).to have_content "Signed in as 2345@2345.com"
#       end
#       Then 'I can enter a message and submit it' do
#         fill_in 'content', with: "Dry as a tomb, your coloured lids"
#         click_button 'Post'
#       end
#       And 'I should see the message displayed' do
#         expect(page).to have_content "Dry as a tomb, your coloured lids"
#       end
#       And 'I should see the username displayed next to it' do
#         expect(page).to have_content "2345 -- Dry as a tomb, your coloured lids"
#       end
#     end
#   end
# end
