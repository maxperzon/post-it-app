class QuotesController < ApplicationController
	before_action :find_quote, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	
	def index
		@quotes = Quote.where(user_id: current_user)
	end

	def show
	end

	def new
		@quote = current_user.quotes.build
	end

	def create
		@quote = current_user.quotes.build(quote_params)

		if @quote.save
			redirect_to @quote
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @quote.update(quote_params)
			redirect_to @quote
		else
			render 'edit'
		end
	end

	def destroy
		@quote.destroy
		redirect_to quotes_path
	end

	private

	def find_quote
		@quote = Quote.find(params[:id])
	end

	def quote_params
		params.require(:quote).permit(:title, :content)
	end
end
