require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  context 'going to the home page' do
    Steps 'going to the forum page' do
      Given 'that I am on the home page' do
        visit '/'
      end
      Then 'I can put in my username and password' do
        fill_in 'Username', with: 'Tyger'
        fill_in 'Password', with: 'William Blake'
      end
      And 'I can push the Log In button' do
        click_button 'Log In'
      end
    end
  end

  context 'going to the forum page' do
    Steps 'registering and logging in' do
      Given 'that I am on the home page' do
        visit '/'
      end
      And 'I go to the registration page' do
        click_link 'Register'
        expect(page).to have_content "Register"
      end
      Then 'I can register a new user' do
        fill_in 'Username', with: '1234'
        fill_in 'Password', with: '5678'
        click_button 'Submit'
        expect(page).to have_content "log in"
      end
      And 'I can enter the username and password' do
        fill_in 'Username', with: '1234'
        fill_in 'Password', with: '5678'
        click_button 'Log In'
        expect(page).to have_content "Welcome 1234"
      end
    end
  end
end
