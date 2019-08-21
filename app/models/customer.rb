class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :email, presence: true
end
