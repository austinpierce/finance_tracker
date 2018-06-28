class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends # initiate instance variable
  end
  
  def search
     if params[:search_param].blank? # search_param comes from friends/lookup view
        flash.now[:danger] = "You have entered an empty search"
      else
        @users = User.search(params[:search_param]) 
       # .search comes from user model
        flash.now[:danger] = "No users match this search criteria" if @users.blank?
      end
        respond_to do |format| 
          format.js { render partial: 'friends/result' } 
        end
  end
  
end