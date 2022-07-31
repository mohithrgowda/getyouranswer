# To deliver this notification:
#
# AnswerNotification.with(post: @post).deliver_later(current_user)
# AnswerNotification.with(post: @post).deliver(current_user)

class AnswerNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  deliver_by :database
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
  def message
    @question = Question.find(params[:answer][:question_id])
    @answer = Answer.find(params[:answer][:id])
    @user = User.find(@answer.user_id)
    "#{@user.name} answered your question - #{@question.description.truncate(20)}"
  end

  def url
    question_path(Question.find(params[:answer][:question_id]))
  end
end
