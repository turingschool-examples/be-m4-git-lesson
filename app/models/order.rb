class Order < ApplicationRecord
  belongs_to :user
  has_many   :item_orders
  has_many   :items, through: :item_orders

  validates :status, presence: true

  enum status: [ "ordered", "paid", "cancelled", "completed" ]

  def format_date
    created_at.strftime(format='%m/%d/%Y')
  end
end
