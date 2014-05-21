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
    @questions = Question.all
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
     params.require(:question).permit(:question, :answer, :question_type, :difficulty)
    end
end
