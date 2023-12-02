class ApplicationController < ActionController::Base
    def check_session
        if session[:user_id]
            
        else
            redirect_to login_path
        end
    end
end
