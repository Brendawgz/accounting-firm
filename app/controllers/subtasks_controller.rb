class SubtasksController < ApplicationController
    before_action :set_subtask, only: [:task_select, :edit, :update, :show, :destroy]
    before_action :set_team
    before_action :require_staff
    
    def search
        @subtasks = Subtask.search(params[:search_param])
        render 'subtasks/search'
    end
    
    def index
        @subtasks = Subtask.all
    end
    
    def team_tasks
        @team = current_staff.team
        @subtasks = []
        @team.staffs.each do |staff|
            staff_tasks = staff.subtasks
            @subtasks = @subtasks + staff_tasks
        end
        @subtasks.uniq
    end
    
    def my_tasks
       @subtasks = current_staff.subtasks 
    end
        
    def new
        @subtask = Subtask.new
    end
    
    def create
        @subtask = Subtask.new(subtask_params)
        if @subtask.save
            redirect_to team_tasks_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @subtask.update(subtask_params)
            @subtask.update(subtask_params)
            @staff = @subtask
            redirect_to team_tasks_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @subtask.destroy
        redirect_to team_tasks_path
    end
    
    private
    def subtask_params
      params.require(:subtask).permit(:name, :category, :deadline, :comments, :staff_id, :task_id)
    end
    
    def set_subtask
        @subtask = Subtask.find(params[:id])
    end
    
    def set_team
        if @subtask
            @team = Team.find(@subtask.task.team.id)
        else
            @team = Team.find(current_staff.team.id)
        end
    end
    
    def require_staff
      if !staff_signed_in?
        redirect_to root_path
      end
    end
  
end