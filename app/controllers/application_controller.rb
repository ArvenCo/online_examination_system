class ApplicationController < ActionController::Base
    def check_session
        if session[:user_id]
            @current_user = User.find_by_id(session[:user_id])
        else
            redirect_to user_path
        end
    end
end
