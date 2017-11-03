class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string     :title
      t.text       :description
      t.integer    :price
      t.string     :image_file_name
      t.integer    :image_file_size
      t.string     :image_content_type
      t.datetime   :image_uploaded_at
      t.integer    :status, default: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
