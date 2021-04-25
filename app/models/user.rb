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

  def full_name(first_name, last_name)
    puts "#{first_name} #{last_name}"
  end
end
