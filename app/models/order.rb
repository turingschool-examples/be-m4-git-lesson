class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_items
  has_many   :items, through: :order_items

  validates :status, presence: true

  enum status: %w(ordered paid cancelled completed)

  def format_date(date)
    date.strftime(format='%m/%d/%Y')
  end
end
