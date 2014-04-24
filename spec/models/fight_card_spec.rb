require 'spec_helper'

describe FightCard do

  subject { FightCard.new }

  it "should be a calss of fightcard" do
  	expect(subject).to be_a FightCard
  end

  it "should respond to its methods" do
  	expect(subject).to respond_to(:title)
  	expect(subject).to respond_to(:city)
  	expect(subject).to respond_to(:start_time)
  end
end
