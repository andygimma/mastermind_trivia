class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @question = Question.new
  end

  def edit
    question_id = params["id"]
    @question = Question.find(question_id) 
  end

  def index
    category = params["category"]
    difficulty = params["difficulty"]
    @questions = nil
    
    # handle blank and "All"
    if category and difficulty
      if category == "" or category == "All"
	if difficulty == "All" or difficulty == ""
	  @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
	else
	  @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC').where("difficulty = ?", difficulty)
	end
      elsif difficulty == "" or difficulty == "All"
	if category == "All" or category == ""
	  @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
	else
	  @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC').where("category = ?", category)
	end      else
	@questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC').where("difficulty = ? AND category = ?", difficulty, category)
      end

    else
      @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')

    end
    @categories = Category.all
  end
  
  def show
    question_id = params["id"]
    @question = Question.find(question_id) 
  end
  
  def create
    @question = current_user.questions.build(question_params)
    @question.save
    redirect_to questions_path
  end
  
  def update
    question_id = params["id"]
    @question = current_user.questions.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)  
  end
  
  def destroy
    question_id = params["id"]
    question = current_user.questions.find(question_id)
    question.destroy
    redirect_to questions_path
  end
 
  private
    def question_params
     params.require(:question).permit(:question, :answer, :question_type, :difficulty, :category, :notes)
    end
end
