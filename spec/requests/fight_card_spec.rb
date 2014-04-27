describe "Figh Cards" do
	describe "Login" do
		before { visit signin_path }
		let(:user) {FactoryGirl.create(:user)}
		subject { page }

		context "when user is not signed in" do
			it "should not have the create a fight card option" do
				expect(subject).to_not have_content("Create a Fight Card")
			end
		end

		context "when user is not an admin" do
			before do
				user.admin = false
				fill_in "email", 	with: user.email
				fill_in "password", with: user.password
				click_button "Log in"
			end
		
			# it "should not have the create a fight card option" do
			# 	expect(user.admin).to be_false
			# 	expect(subject).to_not have_content("Create a Fight Card")
			# end
		end

		context "when user is an admin" do
			before do
				fill_in "email", 	with: user.email
				fill_in "password", with: user.password
				click_button "Log in"
			end
		
			it "should not have the create a fight card option" do
				expect(subject).to have_content("Create a Fight Card")
			end
		end
	end 
end