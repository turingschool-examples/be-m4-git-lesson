class Item < ApplicationRecord
  validates :title,
            :description,
            :price,
            :status,
            :category,
             presence: true

  validates_uniqueness_of :title

  validates :image, attachment_presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :category

  enum status: [ :active, :retired ]
end