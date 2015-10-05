class QuotesController < ApplicationController
	before_action :find_quote, only: [:show, :edit, :update, :destroy]
	
	def index
		@quotes = Quote.all.order("created_at DESC")
	end

	def show
	end

	def new
		@quote = Quote.new
	end

	def create
		@quote = Quote.new(quote_params)

		if @quote.save
			redirect_to @quote
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def find_quote
		@quote = Quote.find(params[:id])
	end

	def quote_params
		params.require(:quote).permit(:title, :content)
	end
end
