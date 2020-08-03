class AddCarrerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :carrer, :string
  end
end
