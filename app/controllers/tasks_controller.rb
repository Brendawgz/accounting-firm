class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :show, :destroy]
    before_action :require_staff
    before_action :require_same_staff, only: [:edit, :update, :show, :destroy]
    
    def index
        @tasks = task.all
    end
        
    def new
        @task = task.new
    end
    
    def create
        @task = task.new(task_params)
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
    
    def require_same_staff
      if current_staff != @task.team.staffs and !current_staff.admin?
        redirect_to root_path
      end
    end
  
end