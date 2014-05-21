class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
  end

  def show
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(category_params)
#     @category.save
    redirect_to new_question_path
  end
  
  private
    def category_params
     params.require(:category).permit(:name)
    end
end
