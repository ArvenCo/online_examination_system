class Item < ApplicationRecord
  belongs_to :exam
  has_many :choices,
  accepts_nested_attributes_for :choices

  validates :question, presence: true
  validates :exam_id, presence: true
end
