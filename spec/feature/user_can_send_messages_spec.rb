# require 'rails_helper'

# feature 'user can send messages' do
#     context 'sending messages' 

#     before do
#         visit user_session_path
#         create(:user, email: 'user@mail.com', password: '12345678', name: 'Name')
#         create(:usertwo, email: 'bigrat@mail.com', password: '11223344', name: 'bigrat')
#         click_on 'Login'
#         fill_in 'Email', :with => 'user@mail.com'
#         fill_in 'Password', :with => '12345678'
#         click_on 'Log in'
#     end


#     it 'check if there is an inbox button' do
#         expect(page).to have_content'Inbox'
#     end

#     it 'click on inbox to compose message' do
#         click_on 'Inbox'
#         expect(page).to have_content 'Compose'
#         click_on 'Compose'
#     end


#     it 'Select a recipient' do
#         click_on 'bigrat'
#     end

# end