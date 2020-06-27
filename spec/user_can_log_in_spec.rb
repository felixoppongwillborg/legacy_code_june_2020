require "rails_helper"

feature 'User can log in' do
    context 'Sign in to account'
    before do
        visit root_path
end

it 'displays a log in button' do
    expect(page).to have_content 'Login'
    click_on 'Login'
end
end 



