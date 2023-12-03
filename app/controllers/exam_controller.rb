class ExamController < ApplicationController
    def index
        check_session
        @exam = Exam.new
        @ins_exams = Exam.all
    end

    def edit
        check_session
        if Exam.exists?(params[:id])
            @exam = Exam.find(params[:id])
            
        else
            render_404
        end
    end

    def update
        exam = Exam.find(params[:id])
        exam.name = params[:exam][:name]
        if exam.save
          flash[:success] = "Exam was successfully updated"
          redirect_to edit_exam_path
        else
          flash[:error] = "Something went wrong"
          render :edit
        end
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