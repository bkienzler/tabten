class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player1,     null: false
      t.integer :player2,     null: false
      
      t.datetime :date_created
      t.datetime :date_played
      
      t.timestamps
      
      t.integer :winner
    end
  end
end
