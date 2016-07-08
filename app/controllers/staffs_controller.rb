class StaffsController < ApplicationController
    before_action :set_staff, only: [:show]
    before_action :require_admin
    
    def index
        @staffs = Staff.all
        @images = Image.all
    end
    
    def show
        
    end
    
    private
    
    def set_staff
        @staff = Staff.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
end