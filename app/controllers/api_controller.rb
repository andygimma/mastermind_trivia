class ApiController < ApplicationController
  before_action :authenticate_user!

  def questions
    @questions = Question.all
    @questions_list = @questions.map do |u| 
      {:value => u.question, :id => u.id}
    end
    render json: @questions_list
  end
end
