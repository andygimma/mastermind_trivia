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
    
    # a bit of a hack.
    # first, see if params are set, if so, you'll need a query
    # if a particular attribute returns a query of '' then you don't want to search for it. So rather than come up with a series of cases to see which queries to run, we came up with a single case. If an attribute is set to search '', set it to search the opposite of that, since it's really asking for all, and since those fields are required.
    @questions = get_questions_by_params(params)

    
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
    
    def get_category_query_string(category)
      case category
	when "" then "category != ? AND "
	else "category = ? AND "
      end
    end
    
    def get_difficulty_query_string(difficulty)
      case difficulty
	when "" then "difficulty != ? AND "
	else "difficulty = ? AND "
      end
    end
    
    def get_question_type_query_string(question_type)
      case question_type
	when "" then "question_type != ?"
	else "question_type = ? "
      end
    end
    
    def set_difficulty_to_int(difficulty)
      if difficulty == ""
	difficulty = -1
      end
      difficulty
    end
    
    def get_questions_by_params(params)
      if params.has_key?(:category) or params.has_key?(:difficulty) or params.has_key?(:question_type)

	category_string = get_category_query_string(params[:category])
	difficulty_string = get_difficulty_query_string(params[:difficulty])
	question_type_string = get_question_type_query_string(params[:question_type])
	
	query_string = category_string + difficulty_string + question_type_string
	
	difficulty_int = set_difficulty_to_int(params[:difficulty])

	@questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC').where(query_string, params[:category], difficulty_int, params[:question_type])
      else
	@questions = Question.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
      end
    end
end
