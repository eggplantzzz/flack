require 'rails_helper'

RSpec.feature "Settings", type: :feature do
  context 'settings page' do
    Steps 'operating settings page and sending pms' do
      Given 'that I have registered two users' do
        visit '/'
        click_link 'Register'
        fill_in 'Username', with: "12"
        fill_in 'Password', with: "12"
        click_button 'Submit'
        visit '/'
        click_link 'Register'
        fill_in 'Username', with: "34"
        fill_in 'Password', with: "34"
        click_button 'Submit'
      end
      Then 'I can log in as one' do
        fill_in "Username", with: "34"
        fill_in "Password", with: "34"
        click_button 'Log In'
      end
      Then 'I can click on the send private message link' do
        click_link 'Send private message'
      end
      And 'send the other a private message' do
        fill_in 'Username', with: "12"
        fill_in 'Message', with: "Hello"
        click_button 'Send'
      end
      And 'I can logout and log back in as the other' do
        click_link 'Log out'
        fill_in "Username", with: "12"
        fill_in "Password", with: "12"
        click_button 'Log In'
      end
      Then 'I can click on the settings link' do
        click_link 'Settings'
      end
      And 'I will see my user settings' do
        expect(page).to have_content "Settings"
      end
      And 'I will see my private messages' do
        expect(page).to have_content "Private messages"
        expect(page).to have_content "34"
      end
      And 'I can open the message from 34' do
        click_link "34"
        expect(page).to have_content "Hello"
      end
    end
  end
end
