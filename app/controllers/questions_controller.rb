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
    difficulty = params["difficulty"].to_s
    question_type = params["question_type"]
    
    if category or difficulty or question_type
      category_string = "category = ? AND "
      difficulty_string = "difficulty = ? AND "
      question_type_string = "question_type = ?"
      
      if category == ""
	category_string = "category != ? AND "
      end
      
      if difficulty == ""
	difficulty_string = "difficulty != ? AND "
      end
      
      if question_type == ""
	question_type_string = "question_type != ?"
      end
      
      query_string = category_string + difficulty_string + question_type_string
      
      
      
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
