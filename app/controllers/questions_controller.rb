class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def edit
  end

  def show
    ### If signed in
    question_id = params["id"]
    raise question_id.to_s
    @question = Question.find(question_id) 
  end
  
  def create
    @question = current_user.questions.build(question_params)
    @question.save
    redirect_to @question
  end
  
  private
    def question_params
     params.require(:question).permit(:question, :answer, :question_type, :difficulty)
    end
end
