class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  # Remember to create a migration!
end
