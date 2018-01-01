class InventoryController < ApplicationController

    def BOH
        if session[:user].nil? or session[:user]['username'].nil?
            redirect_to '/users/login'
        end
    end
end
