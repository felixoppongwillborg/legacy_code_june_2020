require 'rails_helper'

feature 'user can send messages' do
    context 'sending messages' 

    before do
        visit user_session_path
        create(:user, email: 'user@mail.com', password: '12345678')
        click_on 'Login'
        fill_in 'Email', :with => 'user@mail.com'
        fill_in 'Password', :with => '12345678'
        click_on 'Log in'
    end


    it 'check if there is an inbox button' do
        expect(page).to have_content'Inbox'
    end
end