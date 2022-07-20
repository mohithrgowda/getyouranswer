class UsersController < ApplicationController
  before_action :set_user
  def profile
    @questions=@user.questions.all
    @answers=@user.answers.all
  end

  private 
  
  def set_user
    @user=User.find(params[:id])
  end
end
