class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.all
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question created successfully."
      redirect_to questions_path
    else
      flash[:notice] = @question.errors.full_messages.first
      render action: 'new'
    end
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
