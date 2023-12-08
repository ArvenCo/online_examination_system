class ExamSessionController < ApplicationController
    def index
        check_session
        @exam_session = ExamSession.where(exam_id: params[:id])
    end
    
end