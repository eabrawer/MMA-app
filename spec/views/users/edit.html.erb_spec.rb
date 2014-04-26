require 'spec_helper'

describe "users/edit.html.erb" do
	before { visit edit_user_path }
	let(:user) {FactoryGirl.create(:user)}
	subject { page }

	it "should" do
		
	end
end
