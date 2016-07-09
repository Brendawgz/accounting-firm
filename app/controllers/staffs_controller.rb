class StaffsController < ApplicationController
    before_action :set_staff, only: [:edit, :update, :show, :destroy]
    before_action :require_admin
    
    def index
        @staffs = Staff.all
    end
        
    def new
        @staff = Staff.new
        @teams = Team.all
    end
    
    def create
        @staff = Staff.new(staff_params)
        if @staff.save
            redirect_to staffs_path
        else
            render 'new'
        end
    end
    
    def edit
        @teams = Team.all
    end
    
    def update
        if @staff.update(staff_params)
            sign_in(@staff, :bypass => true)
            redirect_to staffs_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @staff.destroy
        redirect_to staffs_path
    end
    
    private
    def staff_params
      params.require(:staff).permit(:name, :email, :password, :password_confirmation, :admin, :team_id, :picture)
    end
    
    def set_staff
        @staff = Staff.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
  
end