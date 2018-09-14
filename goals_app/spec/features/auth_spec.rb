require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign up! Or else!'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'Socrates'
      fill_in 'password', with: 'starwars'
      click_on 'Create User'
    end

    scenario 'redirects to index page after signup' do
      expect(page).to have_content 'Socrates'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Socrates'
    end
  end

  
end
