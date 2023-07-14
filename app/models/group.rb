class Group < ApplicationRecord
  belongs_to :user
  has_many :groups_deals
  has_many :deals, through: :groups_deals, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :icon, presence: true
end
