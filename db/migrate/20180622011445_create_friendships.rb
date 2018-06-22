class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.belongs_to :user
      t.belongs_to :friend, class: 'User' 
      # Don't have friend model so we need to give it a class
      t.timestamps
    end
  end
end
