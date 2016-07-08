class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :show, :destroy]
    before_action :require_admin
    
    def index
        @tasks = Task.all
    end
        
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @task.update(task_params)
            @task.update(task_params)
            redirect_to tasks_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @task.destroy
        redirect_to tasks_path
    end
    
    private
    def task_params
      params.require(:task).permit(:name, :charge, :payment, :type, :deadline, :completion, :comments, :team_id, :client_id)
    end
    
    def set_task
        @task = task.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
  
end