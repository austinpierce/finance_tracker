class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends # initiate instance variable
  end
  
  def search
    @users = User.search(params[:search_param])
              # .search is defined in the user model
    render json: @users
  end
  
end