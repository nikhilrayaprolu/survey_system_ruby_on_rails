class QuestionsController < ApplicationController
	before_action :set_question ,only: [:show, :edit, :update, :destroy,:showanswers]
	before_action :authorize
	skip_before_action :verify_authenticity_token
	def new
		@question = Question.new
	end
	def index
		@questions = Question.all
	end
	def showanswer
		@question = Question.find(params[:id])
	end
	def show
		@answer=Answer.where(question_id: params[:id],user_id:session[:user_id])
		puts @answer

		
	end
	def create
		@question = Question.new(question_params)
		respond_to do |format|
			if @question.save
				format.html { redirect_to @question, notice: 'Question was successfully created.' }
				format.json { render action: 'show', status: :created, location: @question }
			else
				format.html { render action: 'new' }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end
		end
	end
	def update
		respond_to do |format|
			puts question_params
			if @question.update(question_params)
				format.html { redirect_to @question, notice: 'Question was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@question.destroy
		respond_to do |format|
			format.html { redirect_to questions_url }
			format.json { head :no_content }
		end
	end
	def dashboard
		@connection = ActiveRecord::Base.connection
		sql="SELECT DISTINCT Q.id,Q.question FROM questions as Q , answers as A where Q.id=A.question_id and Q.updated_at<A.updated_at and A.user_id="+session[:user_id].to_s
		@inactive=@connection.execute(sql)
		puts @inactive

	end
	def dashboardactive
		@connection = ActiveRecord::Base.connection
		sql="SELECT * FROM questions where id NOT IN (SELECT DISTINCT Q.id FROM questions as Q , answers as A where Q.id=A.question_id and Q.updated_at<A.updated_at and A.user_id="+session[:user_id].to_s+")"
		@active=@connection.execute(sql	)
	end	


	private

    # Use callbacks to share common setup or constraints between actions.
    def set_question
    	@question = Question.find(params[:id])
    	session[:question_id]=params[:id]
    end

    def question_params
    	params.require(:question).permit(:question, :option1,:option2,:option3,:option4,:typeofquestion)
    end
end
