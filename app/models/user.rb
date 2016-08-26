class User < ActiveRecord::Base
  has_secure_password
  has_many :rounds
  has_many :decks, through: :rounds

  has_many :guesses

  validates :email, :username, presence: true
  validates :email, format: {with: /\A\w+@\w+[.]\w+\z/i, message: "must be valid email address."}
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  # Remember to create a migration!
end
