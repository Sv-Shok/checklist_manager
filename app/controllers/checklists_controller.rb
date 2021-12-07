class ChecklistsController < ApplicationController
  before_action :find_checklist, only: [:show, :edit, :update, :destroy]  

  def index
    @checklists = Checklist.order(created_at: :desc).page(params[:page])
  end

  def show
  end  
  
  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
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
    params.require(:checklist).permit(:title, :description)
  end
  
  def find_checklist
    @checklist = Checklist.find(params[:id])
  end  

end
