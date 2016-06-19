require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  context 'registering as a user' do
    Steps 'for registering' do
      Given 'that I am on the home page' do
        visit '/'
      end
      And 'that I click on the register link' do
        click_link 'Register'
      end
      Then 'I arrive at the registration page' do
        expect(page).to have_content 'Register'
      end

      Given 'that I am on the registration page' do
        visit 'register'
      end
      Then 'I can fill in my user name and password' do
        fill_in 'Username', with: 'Alladin'
        fill_in 'Password', with: 'DonaldDraper'
      end
      And 'I can push the submit button' do
        click_button 'Submit'
      end
      And 'if I go back to the registration page' do
        click_link 'Register'
      end
      And 'try to register the same name and push submit I should get an error message' do
        fill_in 'Username', with: 'Alladin'
        fill_in 'Password', with: 'DonaldDraper'
        click_button 'Submit'
        expect(page).to have_content 'Username already exists'
      end
    end
  end
end
