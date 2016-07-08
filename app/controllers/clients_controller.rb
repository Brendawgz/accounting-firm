class ClientsController < ApplicationController
    before_action :set_client, only: [:show]
    before_action :require_admin
    
    def index
        @clients = Client.all
    end
    
    def show

    end
    
    private
    
    def set_client
        @client = Client.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
end