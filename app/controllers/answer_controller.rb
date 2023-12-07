class AnswerController < ApplicationController

    def new
       check_session
        @exam = Exam.find(params[:id])
    end
end