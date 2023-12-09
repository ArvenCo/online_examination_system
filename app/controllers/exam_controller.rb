class ExamController < ApplicationController
    def index
        check_session
        @exam = Exam.new
        if params[:search].present?
            user_ids = User.where("name LIKE ?", "%"+ params[:search] +"%").pluck(:id)
            
            if user_ids.length > 0
                @exams = Exam.where("name LIKE ?", "%"+params[:search]+"%").or(Exam.where(user_id: user_ids))
            else
                @exams = Exam.where("name LIKE ?", "%"+params[:search]+"%")
            end
            
        else
            @exams = Exam.all
        end
        
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
        
        if Exam.find(exams_params).empty?
            exam = Exam.new(exams_params)
            if exam.save
                flash[:success] = "Exam successfully created"
                redirect_to edit_exam_path(exam)
            else
                flash.now[:error] = "Something went wrong"
            end
        else
            flash.now[:error] = "Exam already exists"
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