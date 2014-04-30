class FightsController < ApplicationController

	def index
		@fight = Fight.all
	end

	def show
		@fight = Fight.find(params[:id])
	end

	def new
		@fight = Fight.new 
	end

	def create
		@fight = Fight.new(fight_params)
		if @fight.save
			redirect_to @fight, :notice => "Your fight was successfully created!"
		else
			render "new"
		end
	end

	def edit
		@fight = Fight.find(params[:id])
	end

	def update
		@fight = Fight.find(params[:id])
		if @fight.update_attributes(fight_params)
			redirect_to @fight, :notice => "Your fight was successfully updated!"
		else
			render "edit"
		end
	end

	def destroy
		@fight = Fight.find(params[:id])
		@fight.destroy
		redirect_to @fightcard, :notice => "Your fight was successfully deleted!"
	end

	private

	def fight_params
  		params.require(:fight).permit(:division)
	end
end
