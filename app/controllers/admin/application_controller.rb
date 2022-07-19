class Admin::ApplicationController < ApplicationController
    before_action :authorize_user
    private 
    def authorize_user
        if(current_user.role != "ADMIN")
            redirect_to root_path,notice: "You are not allowed to access this panel."
        end
    end
end
