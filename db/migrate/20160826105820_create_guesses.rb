class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :user_id, null: false
      t.integer :card_id, null: false

      t.timestamps
    end
  end
end
