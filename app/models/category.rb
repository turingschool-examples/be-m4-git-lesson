class Category < ApplicationRecord
    validates :title, presence: true
    has_many :items
end