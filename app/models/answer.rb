class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_rich_text :body
end
