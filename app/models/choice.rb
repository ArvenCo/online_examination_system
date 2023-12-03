class Choice < ApplicationRecord
  belongs_to :item
  validates :option, presence: true
  validates :correct, :inclusion => {:in => [true, false]}
end
