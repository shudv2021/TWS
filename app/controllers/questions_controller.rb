class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show edit update destroy]
  
  def index
    if params.has_key?(:subject_id)
      @pagy, @questions = pagy Question.where(subject_id: params[:subject_id]).order(created_at: :desc)
    else
      @pagy, @questions = pagy Question.order(created_at: :desc)
    end
    
  end
  
  def show
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :asc
  end
  
  def new
    @question = Question.new
  end
  
  
  def create
    @question = Question.new question_params
    if @question.save
    flash[:success] = 'Question created'
    redirect_to questions_path
    else
    render :new
    end
  end
  
  def edit
  end
  
  def update
    if @question.update(question_params)
    redirect_to questions_path
    else
      render :edit
    end
  end
  
  def destroy
    if @question.destroy
      flash[:success] = 'Question was deleted'
      redirect_to questions_path
    else
      render plain: 'Mistake of delete'
    end
  end
  
  private
  
  def set_question!
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:text, :subject_id)
  end
  
end