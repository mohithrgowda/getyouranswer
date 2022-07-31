class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private
  def notify_recipient
    AnswerNotification.with(answer: self, question: question).deliver_later(question.user)
  end

  def cleanup_notifications
    notifications_as_answer.destroy_all
  end
end
