class ExamSessionController < ApplicationController
    def index
        check_session
        @exam_session = ExamSession.where(exam_id: params[:id])
    end

    def show
        check_session
        @exam_session = ExamSession.find(params[:id])

    end
    
end