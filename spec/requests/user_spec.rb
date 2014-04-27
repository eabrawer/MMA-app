require 'spec_helper'

describe "sessions" do
	describe "Login" do
		before { visit signin_path }
		let(:user) {FactoryGirl.create(:user)}
		let(:user2) {FactoryGirl.create(:user2)}
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
		
		describe "User Index Page" do
			it "should have the username" do
				expect(subject).to have_content(user.username)
			end
		end

		describe "User Show Page" do
			before { visit user_path(user) }

			it "should have a user's information" do
				expect(subject).to have_content(user.username)
				expect(subject).to have_content(user.email)
				expect(subject).to have_content(user.wins)
				expect(subject).to have_content(user.losses)
				expect(subject).to have_content(user.silver)
			end

			it "should have correct user links" do
				expect(subject).to have_content('Edit')
				expect(subject).to have_content('Delete User')
			end

			it "should redirect to user edit page" do
				click_link "Edit"
				expect(subject).to have_content('Users#edit')
			end

			it "should delete user account" do
				click_link "Delete User"
				expect(subject).to have_content("Sign up")
			end
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