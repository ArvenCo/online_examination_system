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
            if Item.exists?(exam_id: @exam.id)
                @items= Item.all
                @choices = Choice.all
            end
            @item = Item.new 
            4.times { @item.choices.build }
        else
            render_404
        end
    end

    def create
        exam = Exam.new(exams_params)
        if exam.save
            redirect_to root_path
        else
            flash.now[:error] = exam.errors.full_messages
        end
    end

    def update
        exam = Exam.find(params[:id])
        if exam.update(exams_params)
          flash[:success] = "Exam was successfully updated"
          redirect_back fallback_location: root_path
        else
          flash[:error] = "Something went wrong"
          redirect_back fallback_location: root_path
        end
    end

    private
    def exams_params
        params.require(:exam).permit(:user_id, :name, :timer)
    end
end