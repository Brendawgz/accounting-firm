class TeamsController < ApplicationController
    before_action :set_team, only: [:edit, :update, :show, :destroy]
    before_action :require_admin, only: [:index, :new, :create, :destroy, :search]
    
    def search
        @teams = Team.search(params[:search_param])
        render 'teams/search'
    end
   
    def index
        @teams = Team.all
    end
        
    def new
        @team = Team.new
        @tasks = Task.all.find_all { |task| task.team.nil? }
    end
    
    def create
        @team.attributes = {'staff_ids' => []}.merge(params[:team] || {})
        @team.attributes = {'task_ids' => []}.merge(params[:team] || {})
        @team = Team.new(team_params)
        if @team.save
            redirect_to teams_path
        else
            render 'new'
        end
    end
    
    def edit
        @tasks = Task.all.find_all { |task| task.team.nil? || task.team == @team }
    end
    
    def update
        @team.attributes = {'staff_ids' => []}.merge(params[:team] || {})
        @team.attributes = {'task_ids' => []}.merge(params[:team] || {})
        if @team.update(team_params)
            @team.update(team_params)
            redirect_to teams_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @team.destroy
        redirect_to teams_path
    end
    
    private
    def team_params
      params.require(:team).permit(:name, :picture, :comments, staff_ids: [], task_ids: [])
    end
    
    def set_team
        @team = Team.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
  
end