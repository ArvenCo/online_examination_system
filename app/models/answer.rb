class Answer < ApplicationRecord
  belongs_to :exam_session
  belongs_to :choice

  validates :exam_session, presence: true
  validates :choice_id, presence: true
end
