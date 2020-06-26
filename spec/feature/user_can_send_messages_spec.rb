require 'rails_helper'

feature 'user can send messages' do
    context 'sending messages' 

    before do
      visit user_session_path
      create(:user, email: 'user@mail.com', password: '12345678', name: 'Name')
      create(:user, email: 'bigrat@mail.com', password: '11223344', name: 'bigrat')
      click_on 'Login'
      fill_in 'Email', :with => 'user@mail.com'
      fill_in 'Password', :with => '12345678'
      click_on 'Log in'
    end


    it 'check if there is an inbox button' do
      expect(page).to have_content'Inbox'
    end

    it 'click on inbox to compose message, select recipient and send' do
      click_on 'Inbox'
      expect(page).to have_content 'Compose'
      click_on 'Compose'
      select 'bigrat', :from => 'Recipients'
      fill_in 'Subject', :with => 'hey'
      fill_in 'Type your message here', :with => 'hej då'
      click_on 'Send Message'
      expect(page).to have_content 'Your message was successfully sent!'
    end

  

    

end