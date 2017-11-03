class Order < ApplicationRecord
  belongs_to :user

  validates :status, presence: true

  enum status: [ "ordered", "paid", "cancelled", "completed" ]
end
