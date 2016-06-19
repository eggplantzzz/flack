require 'rails_helper'

RSpec.feature "Postings", type: :feature do
  context 'forum view' do
    Steps 'going to the forum view' do
      Given 'that I am on the home page' do
        visit '/'
      end
      And 'I go to the registration page' do
        click_link 'Register'
        expect(page).to have_content "Register"
      end
      Then 'I can register a new user' do
        fill_in 'Username', with: '2345'
        fill_in 'Password', with: '6789'
        click_button 'Submit'
        expect(page).to have_content "log in"
      end
      And 'I can enter the username and password' do
        fill_in 'Username', with: '2345'
        fill_in 'Password', with: '6789'
        click_button 'Log In'
      end
      Given 'that I\'m on the forum page' do
        expect(page).to have_content "Welcome 2345"
      end
      Then 'I can enter a message and submit it' do
        fill_in 'content', with: "Dry as a tomb, your coloured lids"
        click_button 'Post'
      end
      And 'I should see the message displayed' do
        expect(page).to have_content "Dry as a tomb, your coloured lids"
      end
      And 'I should see the username displayed next to it' do
        expect(page).to have_content "Dry as a tomb, your coloured lids -- 2345"
      end
    end
  end
end
