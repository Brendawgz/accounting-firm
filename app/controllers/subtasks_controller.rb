class SubtasksController < ApplicationController
    before_action :set_subtask, only: [:edit, :update, :show, :destroy]
    before_action :require_staff
    before_action :require_same_staff, only: [:edit, :update, :show, :destroy]
    
    def index
        @subtasks = subtask.all
    end
        
    def new
        @subtask = subtask.new
    end
    
    def create
        @subtask = subtask.new(subtask_params)
        if @subtask.save
            redirect_to subtasks_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @subtask.update(subtask_params)
            @subtask.update(subtask_params)
            redirect_to subtasks_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @subtask.destroy
        redirect_to subtasks_path
    end
    
    private
    def subtask_params
      params.require(:subtask).permit(:name, :type, :deadline, :completion, :comments, :staff_id, :task_id)
    end
    
    def set_subtask
        @subtask = subtask.find(params[:id])
    end
    
    def require_same_staff
      if current_staff != @subtask.staff and !current_staff.admin?
        redirect_to root_path
      end
    end
  
end