class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  # Remember to create a migration!

end
