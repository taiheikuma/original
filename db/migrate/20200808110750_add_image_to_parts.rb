class AddImageToParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :image, :string
  end
end
