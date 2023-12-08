class ExamSession < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :answers
  accepts_nested_attributes_for :answers
  
  attribute :score, default: 0
end
