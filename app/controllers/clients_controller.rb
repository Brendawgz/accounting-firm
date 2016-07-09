class ClientsController < ApplicationController
    before_action :set_client, only: [:edit, :update, :show, :destroy]
    before_action :require_admin
    
    def index
        @clients = Client.all
    end
        
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to clients_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @client.update(client_params)
            @client.update(client_params)
            redirect_to clients_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @client.destroy
        redirect_to clients_path
    end
    
    private
    def client_params
      params.require(:client).permit(:name, :email, :picture)
    end
    
    def set_client
        @client = Client.find(params[:id])
    end
    
    def require_admin
      unless staff_signed_in? and current_staff.admin?
        redirect_to root_path
      end
    end
  
end