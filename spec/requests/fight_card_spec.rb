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

			describe "Creating a fight card" do
				before do 
					visit new_fight_card_path 
					fill_in "title", with: "UFC 140"
					fill_in "start_time", with: "April 20"
					fill_in "city", with: "Toronto"								
					click_button "save"
				end

				it "shoudld create a fightcard" do
					expect(subject).to have_content("Your fight card was successfully created!")				
				end

				it "shoudld have correct links" do
					expect(subject).to have_content("Edit")
					expect(subject).to have_content("Delete Fight Card")			
				end

				it "shoudld edit fight card" do
					click_link "Edit"
					expect(subject).to have_content("edit")
					fill_in "title", with: "UFC 150"
					fill_in "start_time", with: "April 21"
					fill_in "city", with: "Montreal"
					click_button "save"	
					expect(subject).to have_content("Your fight card was successfully updated!")					
				end

				it "shoudld delete fight card" do
					click_link "Delete Fight Card"	
					expect(subject).to have_content("Fight Card Index")		
				end

				describe "Creating a fight" do
					it "shoudld visit fight" do
						visit fights_path
					end		
					it "shoudld create a fight" do
						visit new_fight_path
					end				
				end
			end
		end
	end 
end