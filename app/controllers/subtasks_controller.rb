class SubtasksController < ApplicationController
    before_action :set_subtask, only: [:edit, :update, :show, :destroy]
    before_action :require_staff
    
    def index
        @subtasks = Subtask.all
    end
        
    def new
        @subtask = Subtask.new
    end
    
    def create
        @subtask = Subtask.new(subtask_params)
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
        @subtask = Subtask.find(params[:id])
    end
    
    def require_staff
      if !staff_signed_in?
        redirect_to root_path
      end
    end
  
end