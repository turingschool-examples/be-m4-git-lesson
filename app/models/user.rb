class User < ApplicationRecord
  has_many  :orders
  validates :email,
            :first_name,
            :last_name,
            :address,
            :role,
            presence: true

  validates_uniqueness_of :email
  has_secure_password
  enum role: ["default", "admin"]
end
