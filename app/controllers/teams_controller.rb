class TeamsController < ApplicationController
    before_action :set_team, only: [:edit, :update, :show, :destroy]
    before_action :require_admin, only: [:index, :new, :create, :destroy]
    
    def index
        @teams = Team.all
    end
        
    def new
        @team = Team.new
    end
    
    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to teams_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
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
      params.require(:team).permit(:name, :members)
    end
    
    def set_team
        @team = team.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
  
end