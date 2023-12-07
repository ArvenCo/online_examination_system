class Choice < ApplicationRecord
  belongs_to :item
  has_many :answers
  validates :option, presence: true
  validates :correct, :inclusion => {:in => [true, false]}
end
