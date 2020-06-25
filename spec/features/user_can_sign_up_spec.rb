require "rails_helper"

feature 'User can sign up' do
  context 'User needs to sign up to use the app' do
    before do
      visit root_path
      click_on 'Sign up'
      fill_in 'Name', with: 'Pontus'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_on 'Create'
    end

    it 'shows a successful sign up' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

  end

  context 'Sign up was unsuccessful' do
    before do
      visit root_path
      click_on 'Sign up'
      create(:user, email: 'example@example.com', password: 'password123', name: 'Pontus')
    end

    it 'must sign up with unique email' do
      fill_in 'Name', with: 'Pontus'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_on 'Create'
      expect(page).to have_content 'Email has already been taken'
    end
    
    it 'name can not be more than 10 characters' do 
      fill_in 'Name', with: 'simaboreiri'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_on 'Create'
      expect(page).to have_content 'Name is too long (maximum is 10 characters)'
    end

    it 'password must be at least eight character'do
      fill_in 'Name', with: 'Pontus'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'pass'
      fill_in 'Password confirmation', with: 'password123'
      click_on 'Create'
      expect(page).to have_content 'Password is too short (minimum is 8 characters)'
    end

    it 'password must match the password confirmation'do
      fill_in 'Name', with: 'Pontus'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end