class ChoicesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @question = Question.find(params[:question])
    text = params[:text]
    correct = params[:correct] == "1"
    new = Choice.create(:text => text, :correct => correct, :question_id => @question.id)
	 
    if new.correct
	    @question.answer = new
	  end
	 
	  redirect_to question_path(@question)
  end
  
  def destroy
	  @choice = Choice.find(params[:id])
	  @choice.destroy

	  redirect_to question_path(@choice.question)
  end
end
