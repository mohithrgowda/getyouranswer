class TagsController < ApplicationController

  before_action :authenticate_user! ,except: %i[show index]

  def new
    @tag=Tag.new
  end
  def create
    @tag=Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_url(@tag), notice: "Tag was successfully created"}
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def index
    @tags=Tag.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    
  end
  
  def show
    @tag=Tag.find(params[:id])
    
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end