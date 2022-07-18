class Tag < ApplicationRecord
  has_many :question_tags
  has_many :questions ,through: :question_tags
  validates :name,presence: true ,uniqueness: true ,length: {minimum: 3 , maximum: 10}
  
end