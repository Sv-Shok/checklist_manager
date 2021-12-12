class AuditsController < ApplicationController
  before_action :find_checklist, only: [:show, :edit, :update, :destroy]  
    
  def index
    @audits = Audit.all 
  end
  
  def new
    @audit = Audit.new
   
    @questions = current_user.checklists.find(2).questions
    # @checklist.questions.update(checklist_params)
    # @checklist.update(checklist_params)
  end

  def create
    byebug
    @audit = Audit.new
    @checklist = current_user.checklists.build(checklist_params)
    if @checklist.save
      redirect_to root_path
    else
      render 'new'
    end        
  end

  def edit
  end
  
  def update
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist)
    else
      render 'edit'
    end          
  end
  
  def destroy
    @checklist.destroy
    redirect_to root_path
  end
  
  def get_checklists_id
    @checklists = current_user.checklists.all
  end  

  private

  def audit_params
    params.require(:audit).permit(:checklist_id, questions_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
  end

  def find_checklist
    @checklist = current_user.checklists.find(params[:checklist_id])
  end 
end
