class QuestLoggerController < ApplicationController
   def quest_log 
        if session[:user].nil? or session[:user]['username'].nil?
            redirect_to '/user/login'
        end

        @quest_log = QuestLog.where(user_id: session[:user]['user_id'])

        if @quest_log.nil?
            render "newQuestLog"
        else
            render "showQuestLog"
        end
    end

    def new_quest_log
       # Empty until we make this functional
       #@quest_log = QuestLog(:) 
    end


    private 
    def user_parms
        parmas.require(:quest_log).permit(:title)
    end
        
end
