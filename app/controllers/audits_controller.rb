class AuditsController < ApplicationController
  before_action :find_audit, only: [:show, :edit, :update, :destroy]  
    
  def index
    @audits = current_user.audits.order(created_at: :desc).page(params[:page])
  end
  
  def new
    checklist_id = session[:checklist_id]
    @checlist = current_user.checklists.find(checklist_id)
    @questions = current_user.checklists.find(checklist_id).questions
    @audit = current_user.audits.build(attributes = {checklist_id: checklist_id})
    @audit.answers.build
  end

  def create
    @audit = current_user.audits.build(audit_params)
    if @audit.save
      flash[:notice] = "Audit has been created"
      redirect_to audits_path
    else
      puts @audit.errors.full_messages
      render 'new'
    end        
  end

  def edit
    @checlist = current_user.checklists.find(session[:checklist_id])
    @questions = current_user.audits.find(params[:id]).checklist.questions.select{ |question| question.answers.present? }
  end
  
  def update
    if @audit.update(audit_params_update)
      flash[:notice] = "Audit has been updated"
      redirect_to audits_path
    else
      render 'edit'
    end          
  end
  
  def destroy
    @audit.destroy
    flash[:notice] = "Audit has been deleted"
    redirect_to audits_path
  end
  
  def choice_checklist
    if request.get?
      @checklists = current_user.checklists.select{ |checklist| checklist.questions.present? }
    else

      if params['/audits/choice_checklist'].values[0].present?
        session[:checklist_id] = (params['/audits/choice_checklist'].values[0])
        redirect_to new_audit_path
      else
        redirect_to audits_path  
      end  

    end  
  end   

  private

  def audit_params
    params.require(:audit).permit(answers_attributes: Answer.attribute_names.map(&:to_sym).push(:question_id,:_destroy)).merge(checklist_id: session[:checklist_id])
  end

  def audit_params_update
    params.require(:audit).permit(:checklist_id, answers_attributes: Answer.attribute_names.map(&:to_sym).push(:question_id,:_destroy)).merge(updated_at: Time.now)
  end

  def find_audit
    @audit = current_user.audits.find(params[:id])
  end  
end
