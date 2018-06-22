class Friendship < ApplicationRecord
  belongs_to :user # <-- class
  belongs_to :friend, :class_name => 'User' # <-- friend is not a class so it needs a class
  
end