class AuditsController < ApplicationController
  before_action :find_audit, only: [:show, :edit, :update, :destroy]  
    
  def index
    @audits = Audit.all 
  end
  
  def new
    # @audit = Audit.new
    @questions = current_user.checklists.find(2).questions
    @audit = current_user.audits.build
    @audit.answers.build(attributes = {question_id: 2})
  end

  def create
    @audit = current_user.audits.build(audit_params)
    byebug
    if @audit.save
      redirect_to root_path
    else
      puts @audit.errors.full_messages
      render 'new'
    end        
  end

  def edit
  end
  
  def update
    if @audit.update(audit_params)
      redirect_to audit_path(@audit)
    else
      render 'edit'
    end          
  end
  
  def destroy
    @audit.destroy
    redirect_to root_path
  end
  
  # def get_checklists_id
  #   @checklists = current_user.checklists.all
  # end  

  private

  def audit_params
    params.require(:audit).permit(:checklist_id, answers_attributes: Answer.attribute_names.map(&:to_sym).push(:_destroy))
    .merge(checklist_id: 2)
  end

  def find_audit
    @audit = current_user.audits.find(params[:id])
  end  
end
