class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @question = Question.new
  end

  def edit
  end

  def index
    @questions = Question.all
  end
  
  def show
    ### If signed in
    question_id = params["id"]
    @question = Question.find(question_id) 
  end
  
  def create
    @question = current_user.questions.build(question_params)
    @question.save
    redirect_to all_questions_path
  end
 
  private
    def question_params
     params.require(:question).permit(:question, :answer, :question_type, :difficulty)
    end
end
