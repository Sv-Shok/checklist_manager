class QuestionsController < ApplicationController
  
  def show
    @question = question
  end    
    
  def new
    @checklist = checklist
    @question = @checklist.questions.build
  end

  def create
    @question = checklist.questions.build(question_params)
    if @question.save
      redirect_to checklist_path(checklist)
    else
      @checklist = checklist
      render 'new'
    end        
  end

  def destroy
    question.destroy
    redirect_to checklist_path(checklist)
  end  

  private

  def question_params
    params.require(:question).permit(:title, :description, :checklist_id)
  end

  def checklist
    current_user.checklists.find(params[:checklist_id])
  end
  
  def question
    checklist.questions.find(params[:id])
  end
end
