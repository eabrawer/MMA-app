class FightCardsController < ApplicationController

	before_filter :admin?, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@fightcards = FightCard.all
	end

	def show
		@fightcard = FightCard.find(params[:id])
	end

	def new
		@fightcard = FightCard.new
	end

	def create
		@fightcard = FightCard.new(params_fight_card)
		if @fightcard.save
			redirect_to fight_card_path, :notice => "Your fight card was successfully created!"
		else
			render "new"
		end
	end

	def edit
		@fightcard = FightCard.find(params[:id])
	end

	def update
		@fightcard = FightCard.find(params[:id])
		if @fightcard.update_attributes(params_fight_card)
			redirect_to fight_card_path, :notice => "Your fight card was successfully updated!"
		else
			render "edit"
		end
	end

	def delete
		@fightcard = FightCard.find(params[:id])
		@fightcard.destroy
		redirect_to fight_cards_url :notice => "Your fight card was successfully deleted!"
	end

	private

	def params_fight_card
  		params.require(:fightcard).permit(:title, :city, :start_time)
	end

end
