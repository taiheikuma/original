class AddPartToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :part, foreign_key: true
  end
end
