class StaffsController < ApplicationController
    before_action :set_staff, only: [:edit, :update, :show, :destroy]
    before_action :require_admin
    
    def search
        @staffs = Staff.search(params[:search_param])
        render 'staffs/search'
   end
    
    def index
        unless @staffs
            @staffs = Staff.all
        end
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
        current_id = current_staff.id
        if @staff.update(staff_params)
            if @staff.id == current_id
                sign_in(Staff.find(current_id), :bypass => true)
            end
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
      params.require(:staff).permit(:name, :email, :password, :password_confirmation, :admin, :team_id, :picture, :comments)
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