class Owner < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true
end
