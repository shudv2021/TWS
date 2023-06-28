class AnswersController < ApplicationController
  before_action :set_question, only: %i[create destroy edit update]
  before_action :set_answer, only: %i[destroy edit update]
  
  def create
    @answer = @question.answers.new answer_params
    if @answer.save
    flash[:success] = "Answer for this question create"
    redirect_to question_path(@question)
    else
      flash[:success] = "Answer don't create"
      render 'questions/show'
    end
  end
  
  def edit
        
  end
  
  def update
    if @answer.update(answer_params)
    flash[:success] = "Answer for this question was updated"
    redirect_to question_path(@question)
    else
      flash[:success] = "Answer wasn't updated"
      render 'edit'
    end
  end
  
  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:body, :right, :image_path)
  end
  
  def set_question
    @question = Question.find params[:question_id]
  end
  
  def set_answer
    @answer = @question.answers.find params[:id]
  end
end
