class Exam < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
end
