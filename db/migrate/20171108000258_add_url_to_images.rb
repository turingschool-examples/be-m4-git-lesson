class AddUrlToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :image_url, :string
  end
end