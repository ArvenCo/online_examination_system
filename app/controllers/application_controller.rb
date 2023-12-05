class ApplicationController < ActionController::Base
    def check_session
        if session[:user_id] && User.find_by_id(session[:user_id]).present?
            @current_user = User.find_by_id(session[:user_id])
        else
            session[:user_id] = nil
            redirect_to user_path
        end
    end

    def render_404
        render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
end
