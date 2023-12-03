class Item < ApplicationRecord
  belongs_to :exam
  validates :question, presence: true
  validates :exam_id, presence: true
end
