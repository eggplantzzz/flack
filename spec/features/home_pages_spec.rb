require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  context 'going to the home page' do
    Steps 'arriving on the home page' do
      Given 'that I am on the home page' do
        visit '/'
      end
      Then 'I can put in my username and password' do
        fill_in 'User Name', with: 'Tyger'
        fill_in 'Password', with: 'William Blake'
      end
      And 'I can push the Log In button' do
        click_button 'Log In'
      end
    end
  end
end
