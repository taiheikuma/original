class CreateSchdules < ActiveRecord::Migration[5.2]
  def change
    create_table :schdules do |t|
      t.date :day
      t.string :content
      t.string :place
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
