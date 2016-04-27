class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:notice] = "Edit successful"
      redirect_to question_path(@question)
    else
      flash[:notice] = @question.errors.full_messages.first
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).answers.each do |answer|
      answer.destroy
    end
    Question.find(params[:id]).destroy
    flash[:notice] = "Question successfully deleted"
    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
