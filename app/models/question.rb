class Question < ApplicationRecord
  validates :description,presence: true , length: {minimum:5} , format: { with: /[?]/,
    message: "must contain ?" }
    belongs_to :user
    has_many :answers ,dependent: :destroy
end
