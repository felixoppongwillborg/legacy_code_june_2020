feature "user can send messages" do 
    let(:sender) {create(:user, email: 'user@mail.com', password:'12345678', name:'Name') }
    let!(:receiver) {create(:user, email: 'bigrat@mail.com',password:'11223344', name:'Bigrat') }

    describe "sender logs-in and sends message" do    
        before do
            login_as(sender, scope: :user)
            visit new_conversation_path
            select "Bigrat", from: "Recipients"
            fill_in "Subject", with: "Hej"
            fill_in "Type your message here", with: "Hej test"
            click_on "Send Message"  
        end

        it "receives success message" do 
            expect(page).to have_content "Your message was successfully sent!"
        end

        it "message is visible in the sent messages section" do 
            visit mailbox_sent_path
            expect(page).to have_content "Hej test"
        end
    end
end