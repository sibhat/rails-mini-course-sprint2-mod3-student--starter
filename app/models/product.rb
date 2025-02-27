class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true
  validates :cost_cents, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :inventory, presence: true, numericality: { greater_than: 0 }
  scope :in_stock, -> {where("inventory > ?", 0).order(:cost)}
  scope :out_of_stock, -> {where("inventory == ?",0 ).order(:cost)}


  def available?
    inventory > 0
  end

  def reduce_inventory
    update(inventory: inventory - 1)
  end
end
