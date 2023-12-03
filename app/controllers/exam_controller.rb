class ExamController < ApplicationController
    def index
        check_session
        @exam = Exam.new
        @ins_exams = Exam.all
    end

    def create
        exam = Exam.new(user_id: params[:exam][:user_id], name: params[:exam][:name])
        if exam.save
            redirect_to root_path
        else
            flash.now[:error] = exam.errors.full_messages
        end
    end
end