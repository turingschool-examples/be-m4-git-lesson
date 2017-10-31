class Item < ApplicationRecord
    validates :title, :description, :price, :status, :category, presence: true
    has_attached_file :image, presence: true
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    belongs_to :category
end