class InventoryController < ApplicationController
    include  UtilityHelper

    def BOH
        
        if !checkLogin()
            return
        end
        
        @bohs = BagOfHolding.where(user_id: session[:user]['id'])

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
        if !checkLogin()
            return
        end

        if @bohs.nil?
            redirect_to root_url
        end       
    end
    
    def createBOH
        if !checkLogin()
            return
        end
        @boh = BagOfHolding.new(bag_params.merge(:user_id => session[:user]['id']))
        if @boh.save
          redirect_to "/inventory/BOH"
        else
          flash[:notice] = "Bag Creation Failed"
          flash[:color] = "text-danger"
          render "newBOH"
        end
    end

    def deleteBOH
        if !checkLogin()
            return
        end
        
        deletedBags = BagOfHolding.delete(params['id'])

        if deletedBags < 1
            flash[:notice] = "Bag Deletion Failed"
            flash[:color] = "text-danger"
        else
            flash[:notice] = "Bag Deletion Complete"
            flash[:color] = "text-success"
        end


        self.BOH
        return
    end

    def showInventory
        if !checkLogin()
            return
        end
        if params[:id].nil?
            redirect_to "/inventory/BOH"
        end
        
        boh = BagOfHolding.where(user_id: session[:user]['id'], id: params[:id])

        if boh.nil? or boh[0].nil?
            flash[:notice] = "Could not find bag!"
            flash[:color] = "text-danger"
            self.BOH
            return
        end

        @title = boh[0]['name']
        @BOHID = boh[0]['id']
        @inventory = Inventory.where(bag_id: boh[0]['id'])
    end

    def newItem
        @item = Inventory.new
    end
        
    def createItem
        if !checkLogin()
            return
        end
        @item = Inventory.new(item_params)
        if @item.save
            params['id'] = item_params['bag_id']
            self.showInventory
            render "showInventory"
        else
            flash[:notice] = "Item Failed"
            flash[:color] = "text-danger"
          render :action => "newItem", :bohid => params[:bohid]
        end
    end

    def deleteItem
        if !checkLogin()
            return
        end
        
        deletedBags = Inventory.delete(params['id'])

        if deletedBags < 1
            flash[:notice] = "Item Failed"
            flash[:color] = "text-danger"
        else
            flash[:notice] = "Item Complete"
            flash[:color] = "text-success"
        end

        #I should probably just make the params cleaner, but for now this is what it do
        params['id'] = params['bag_id']
        self.showInventory
        render "showInventory"
    end

  private

  def bag_params
    params.require(:bag_of_holding).permit(:name)
  end
  def item_params
    params.require(:inventory).permit(:itemName, :weight, :bag_id)
  end
end
