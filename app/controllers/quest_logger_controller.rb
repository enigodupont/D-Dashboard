class QuestLoggerController < ApplicationController
   def QLOG 
        if session[:user].nil? or session[:user]['username'].nil?
            redirect_to '/user/login'
        end

        @qlog = QuestLog.where(user_id: session[:user]['user_id'])

        if @qlog.nil?
            render "newQuestLog"
        else
            render "showQuestLog"
        end
    end

    def newQuestLog
       @qlog = QuestLog(:) 
    end


    private 
    def user_parms
        parmas.require(:quest_log).permit(:title)
    end
        
end
