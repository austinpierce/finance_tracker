class StocksController < ApplicationController
 
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock]) # referencing model. 
      # :stock is coming from text_field_tag in view
      # render json: @stock
      if @stock # if @stock exists it means it is not nil (check model)
        respond_to do |format| # for ajax
          format.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = "You have entered an invalid stock"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "Please enter a stock"
      redirect_to my_portfolio_path
    end
  end 
end