class FightCardsController < ApplicationController

	before_filter :admin?, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@fight_cards = FightCard.all
	end

	def show
		@fight_card = FightCard.find(params[:id])
	end

	def new
		@fight_card = FightCard.new
	end

	def create
		@fight_card = FightCard.new(params_fight_card)
		if @fight_card.save
			redirect_to fight_card_path, :notice => "Your fight card was successfully created!"
		else
			render "new"
		end
	end

	def edit
		@fight_card = FightCard.find(params[:id])
	end

	def update
		@fight_card = FightCard.find(params[:id])
		if @fight_card.update_attributes(params_fight_card)
			redirect_to fight_card_path, :notice => "Your fight card was successfully updated!"
		else
			render "edit"
		end
	end

	def delete
		@fight_card = FightCard.find(params[:id])
		@fight_card.destroy
		redirect_to fight_cards_url :notice => "Your fight card was successfully deleted!"
	end

	private

	def params_fight_card
  		params.require(:fight_card).permit(:title, :city, :start_time)
	end

end
