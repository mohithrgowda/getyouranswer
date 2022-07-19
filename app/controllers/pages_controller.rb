class PagesController < ApplicationController
  def home
    return redirect_to questions_url if current_user
  end

  def about
  end
end
