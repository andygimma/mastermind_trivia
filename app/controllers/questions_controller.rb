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
    question_type = params["question_type"]
    
    
    # see if params are set
    if category or difficulty or question_type
      
      #set query string to use in MODEL.where()
      # if param = "" then look for all by searching for all != "" 
      # this works because these have to be set.
      # else search the attribute with the given param value
      category_string = case category
			when "" then "category != ? AND "
			else "category = ? AND "
			end
      difficulty_string = case difficulty
			when "" then "difficulty != ? AND "
			else "difficulty = ? AND "
			end
      question_type_string = case question_type
			when "" then "question_type != ?"
			else "question_type = ? "
			end
      
      query_string = category_string + difficulty_string + question_type_string
      if difficulty == ""
	difficulty = -1
      end
      @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC').where(query_string, category, difficulty, question_type)
    else
      @questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end

# 
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
    @question = Question.find(params[:id])
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
     params.require(:question).permit(:question, :answer, :question_type, :difficulty, :category, :notes, :suggested_song)
    end
end
