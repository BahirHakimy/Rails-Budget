class Deal < ApplicationRecord
  belongs_to :user
  has_many :groups_deals
  has_many :groups, through: :groups_deals

  validates :name, presence: true, length: { minimum: 5 }
  validates :amount, presence: true, numericality: true
end
