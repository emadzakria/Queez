class AnswersController < ApplicationController
	before_filter :authenticate_user!, only: [:create]

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(params[:answer])
		@answer.user = current_user
		if @answer.save
			redirect_to @question
		else
			render 'questions/show'
		end
	end

end
