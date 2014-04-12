require 'spec_helper'

describe User do

  subject { User.new }

  it "should be a class of User" do
  	expect(subject).to be_a User
  end

  it "should respond to correct methods" do
  	expect(subject).to respond_to(:username)
  	expect(subject).to respond_to(:email)
  	expect(subject).to respond_to(:losses)
  	expect(subject).to respond_to(:wins)
   	expect(subject).to respond_to(:silver) 	
  end

end
