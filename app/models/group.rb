class Group < ApplicationRecord
  belongs_to :user
  has_many :deals, through: :group_deals
end
