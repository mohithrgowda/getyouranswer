class Question < ApplicationRecord
    belongs_to :user
    has_many :answers ,dependent: :destroy
    
    has_many :question_tags
    has_many :tags ,through: :question_tags

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy

    validates :description,presence: true , length: {minimum:5} , format: { with: /[?]/,
      message: "must contain ?" }
end
