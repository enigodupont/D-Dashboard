class InventoryController < ApplicationController

    def BOH
        if session[:user].nil? or session[:user]['username'].nil?
            redirect_to '/users/login'
        end

        @bohs = BagOfHolding.where(user_id: session[:user]['user_id'])

        if @bohs.nil?
            render "newBOH"
        else
            #Render the page with multiple BOH Selections
            render "showBOHs"
        end
    end

    def newBOH
        @boh = BagOfHolding.new
    end

    def showBOHs
        if @bohs.nil?
            redirect_to root_url
        end       
    end
    
    def createBOH
        @boh = BagOfHolding.new(user_params)
        if @boh.save
          redirect_to "/inventory/BOH"
        else
          flash[:notice] = "Register Failed"
          flash[:color] = "invalid"
          render "newBOH"
        end
    end


  private

  def user_params
    params.require(:bag_of_holding).permit(:name)
  end
end
