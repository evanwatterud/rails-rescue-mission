class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to question_path(Question.find(@answer.question_id))
    else
      flash[:notice] = @answer.errors.full_messages.first
      redirect_to question_path(Question.find(@answer.question_id))
    end
  end

  def answer_params
    params.require(:answer).permit(:question_id, :description)
  end
end
