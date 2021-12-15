class ChecklistsController < ApplicationController
  before_action :find_checklist, only: [:show, :edit, :update, :destroy]  

  def index
    if user_signed_in?
      @checklists = current_user.checklists.order(created_at: :desc).page(params[:page])
    end
  end

  def show
  end  
  
  def new
    @checklist = current_user.checklists.build
    @checklist.questions.build
    # @checklist.questions.build(attributes = {title: 'dsdsdsd', description: 'sdfsffsf'})
  end
  end

  def create
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

  private

  def checklist_params
    params.require(:checklist).permit(:title, :description, questions_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
  end
  
  def find_checklist
    @checklist = current_user.checklists.find(params[:id])
  end  

end
