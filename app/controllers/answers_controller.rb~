class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @answers = Answer.all
    respond_with(@answers)
  end

  def show
    respond_with(@answer)
  end

  def new
  	@question = Question.find params[:question_id]
    @answer = Answer.new
    respond_with(@answer)
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find params[:question_id]
    @answer.question_id =  @question.id
    @answer.user_id =  current_user.id       
    @answer.save
    redirect_to '/questions/'+@answer.question_id.to_s
  end

  def update
		@temp_qid =   @answer.question_id.to_s
    @answer.update(answer_params)
    redirect_to '/questions/'+@temp_qid   
  end

  def destroy    
		@temp_qid =   @answer.question_id.to_s
    @answer.destroy
    redirect_to '/questions/'+@temp_qid    
  end

	def upvote
		@answer = Answer.find(params[:id])
		@answer.liked_by current_user
		
		@temp_qid =   @answer.question_id.to_s    
    redirect_to '/questions/'+@temp_qid   
	end

	def downvote
		@answer = Answer.find(params[:id])
		@answer.downvote_from current_user
		@temp_qid =   @answer.question_id.to_s    
    redirect_to '/questions/'+@temp_qid   
	end



  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :title, :description)
    end
end
