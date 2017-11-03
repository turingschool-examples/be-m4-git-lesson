class Order < ApplicationRecord
  belongs_to :user
  has_many   :itemorders
  has_many   :items, through: :itemorders

  validates :status, presence: true

  enum status: [ "ordered", "paid", "cancelled", "completed" ]
end
