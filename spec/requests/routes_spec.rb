require 'spec_helper'

describe "sessions" do
	describe "Login" do
		before { visit signin_path }
		let(:user) {FactoryGirl.create(:user)}
		subject { page }

		before do
			fill_in "email", 	with: user.email
			fill_in "password", with: user.password
			click_button "Log in"
		end

		it "should redirect to user index" do
			expect(subject).to have_content("Logged in!")
		end

		it "should not have the option of signing up" do
			expect(subject).to_not have_content("Sign up")
		end

		describe "Logout" do
			it "should logout and resirect to the correct page" do
				expect(subject).to have_content("Log out")
				click_link("Log out")
				expect(subject).to have_content("Sign up")
			end
		end
	end
end