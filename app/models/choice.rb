class Choice < ApplicationRecord
  belongs_to :item
  validates :option, presence: true
  validates :correct, presence: true
end
