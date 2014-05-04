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
		@fightcard = FightCard.new(fight_card_params)
		if @fightcard.save
			redirect_to @fightcard, :notice => "Your fight card was successfully created!"
		else
			render "new"
		end
	end

	def edit
		@fightcard = FightCard.find(params[:id])
	end

	def update
		@fightcard = FightCard.find(params[:id])
		if @fightcard.update_attributes(fight_card_params)
			redirect_to @fightcard, :notice => "Your fight card was successfully updated!"
		else
			render "edit"
		end
	end

	def destroy
		@fightcard = FightCard.find(params[:id])
		@fightcard.destroy
		redirect_to fight_cards_url :notice => "Your fight card was successfully deleted!"
	end

	private

	def fight_card_params
  		params.require(:fight_card).permit(:title, :start_time, :city, :fights_attributes => [:id, :division, :_destroy])
	end

end
