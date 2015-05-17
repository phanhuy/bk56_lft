class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index	
  
    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
    else
			  @questions = Question.paginate(:page => params[:page], :per_page => 5)
    end

		if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)   
    end
  	
    @users = User.all
     respond_with(@questions)    
  end

  def show
	  @user = User.find(@question.user_id) 
	 @answers = Answer.where(question_id: @question.id)
	 #@question = Question.find params[:question_id]
    @answer = Answer.new
    respond_with(@question)
  end

  def new
    if current_user==nil then redirect_to '/signin'; return end
    @question = Question.new user: current_user
    respond_with(@question)
  end

  def edit
    if current_user==nil then redirect_to '/signin'; return end
       if current_user.id!=@question.user_id then redirect_to '/questions/'; return end
  end

	
  def create
    @question = Question.new(question_params)
    @question.user_id =  current_user.id   
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    if current_user==nil then redirect_to '/signin'; 
    	return end
    if current_user.id!=@question.user_id then redirect_to '/questions/'; 
      return end
    @question.destroy
   redirect_to "/questions"
  end


	def upvote
	if current_user==nil then redirect_to '/signin'; return end
		@question = Question.find(params[:id])
		@question.liked_by current_user
		redirect_to @question
	end

	def downvote
	if current_user==nil then redirect_to '/signin'; return end
		@question = Question.find(params[:id])
		@question.downvote_from current_user
		redirect_to @question
	end


	def upvote_answer
	if current_user==nil then redirect_to '/signin'; return end
		@question = Question.find(params[:id])
		@question.liked_by current_user
		redirect_to @question
	end

	def downvote_answer
	if current_user==nil then redirect_to '/signin'; return end
		@question = Question.find(params[:id])
		@question.downvote_from current_user
		redirect_to @question
	end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :user_id, :all_tags, :category_id)
    end
end
