class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items 
  has_many :comments
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {message: "A number is required"}
  validates :inventory, presence: true
  validates :inventory, numericality: {message: "A number is required"}
  
  def self.available_items
    self.all.select do |item|
      item.inventory != 0
    end
  end
end
