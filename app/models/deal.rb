class Deal < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :group_deals
end
