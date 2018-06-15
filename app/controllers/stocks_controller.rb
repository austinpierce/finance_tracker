class StocksController < ApplicationController
 
def search
  if params[:stock].blank?
    flash.now[:danger] = "You have entered an empty search"
  else
    @stock = Stock.new_from_lookup(params[:stock]) # referencing model.
    # :stock is coming from text_field_tag in view
    flash.now[:danger] = "You have entered an invalid stock" unless @stock
    # unless @stock exists it means it is not nil (check model)
  end
    respond_to do |format| # for ajax // moved this here for DRY
      format.js { render partial: 'users/resultx' } 
    end
  end 

end