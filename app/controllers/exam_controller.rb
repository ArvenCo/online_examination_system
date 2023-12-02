class ExamController < ApplicationController
    def index
        check_session
    end
end