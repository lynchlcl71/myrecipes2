class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :discription, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :chef
  validates :chef_id, presence: true
end 