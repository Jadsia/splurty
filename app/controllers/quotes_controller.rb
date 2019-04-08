class QuotesController < ApplicationController
    def index
        @quote = Quote.order("RANDOM()").first
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.create(quote_params)
        if @quote.invalid?
            flash[:error] = '<strong>What did you say? Not saved </strong> the data you entered is too short or too long. Try again :)'
        end
        redirect_to root_path
    end

    private 

    def quote_params
        params.require(:quote).permit(:saying, :author)
    end
end
