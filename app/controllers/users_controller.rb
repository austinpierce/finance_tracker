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
       @users = current_user.except_current_user(@users) 
              # except_current_user comes from method in user model
       flash.now[:danger] = "No users match this search criteria" if @users.blank?
     end
       respond_to do |format| 
       format.js { render partial: 'friends/result' } 
     end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      flash[:success] = "Friend was successfully added"
    else
      flash[:danger] = "There was an issue"
    end
    redirect_to my_friends_path
  end
  
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks # shows the user's stocks
  end
  
end