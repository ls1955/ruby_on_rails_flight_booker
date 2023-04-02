class Airport < ApplicationRecord
  validates :code, :name, presence: true
end
