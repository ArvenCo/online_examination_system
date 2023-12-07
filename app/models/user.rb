class User < ApplicationRecord
    has_secure_password
    has_many :exams
    has_many :answers
    validates :name, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :role, presence: true
end
