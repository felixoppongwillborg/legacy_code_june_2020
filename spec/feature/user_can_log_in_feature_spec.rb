require "rails_helper"

feature 'User can log in' do
    context 'Sign in to account'
    before do
      create(:user, email: 'user@mail.com', password: '12345678')  
        visit user_session_path
end

it 'displays a log in button' do
    expect(page).to have_content 'Login'
    click_on 'Login'
end

it 'displays a email form' do
    expect(page).to have_content 'Email'    
end

it 'fills in email and password' do
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "password"
    click_on "Log in"
end


end

# it 'redirect user to ladning page' do
#     expect(page).to have_content 'Signed in successfully.'
# end

# end

