class StocksController < ApplicationController
 
  def search
   @stock = Stock.new_from_lookup(params[:stock]) # referencing model. 
    # where is :stock coming from. Stock model?
    # render json: @stock
    render 'users/my_portfolio'
  end
  
end