class AnswerController < ApplicationController

    def new
        check_session
        @exam = Exam.find(params[:id])
        
        if ExamSession.where(user_id: @current_user.id, exam_id: @exam.id).present?
            @exam_session = ExamSession.find_by(user_id: @current_user.id, exam_id: @exam.id)
        else
            @exam_session = ExamSession.create(user_id: @current_user.id, exam_id: @exam.id)
        end
        @items = Item.where(exam_id: params[:id])
        @answers = Array.new(@items.length, Answer.new)
    end

    def create
        answers = params[:answer][:answer]
        
        answers.each do |item_id, attr|
            
            if Answer.create!(exam_session_id: attr[:exam_session_id], choice_id: attr[:choice_id])
                flash[:success] = "Answer successfully created"
                
            else
                flash[:error] = "Something went wrong"
                redirect_back fallback_location: root_path
            end
        end
        redirect_to root_path
        
    end
    
    

    private
    # def exam_session_params
    #     params.require(:exam_session).permit(choices_attributes: [:id, :user_id, :exam_session_id])
    # end
    
end