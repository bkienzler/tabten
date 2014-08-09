class RenamePlayerColumns < ActiveRecord::Migration
  def change
    rename_column :matches, :player1, :user_1
    rename_column :matches, :player2, :user_2
  end
end
