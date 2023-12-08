class AnswerController < ApplicationController

    def show
        check_session
        @exam_session = ExamSession.find(params[:id])

    end
    

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
        score = 0
        answers.each do |item_id, attr|
            
            if answer = Answer.create!(exam_session_id: attr[:exam_session_id], choice_id: attr[:choice_id])
                flash[:success] = "Answer successfully created"
                choice = Choice.find_by_id(answer.choice_id)
                if choice.correct == true
                    score += 1
                end
            else
                flash[:error] = "Something went wrong"
                redirect_back fallback_location: root_path
            end
        end
        exam_session = ExamSession.find_by_id(params[:answer][:exam_session_id])
        exam_session.update(score: score)
        redirect_to root_path
        
    end
    
end