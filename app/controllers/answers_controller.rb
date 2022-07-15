class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question

  def create
    @answer= @question.answers.create(answer_params)
    @answer.user=current_user

    if @answer.save
      flash[:notice]  = "answer was created"
      redirect_to question_path(@question)
    else
      flash[:alert]  = "answer not created"
      redirect_to question_path(@question)
    end
  end

  def destroy
    @answer=@question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question=Question.find(params[:question_id])
  end

end
