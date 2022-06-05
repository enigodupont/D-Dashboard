class InventoryController < ApplicationController
    include  UtilityHelper

    def bag_of_holding
        
        if !check_login()
            return
        end
        
        @bags = BagOfHolding.where(user_id: session[:user]['id'])

        if @bags.nil?
            render "new_bag_of_holding"
        else
            render "show_bags_of_holding"
        end
    end

    def new_bag_of_holding
        @bag = BagOfHolding.new
    end

    def show_bags_of_holding
        if !check_login()
            return
        end

        if @bags.nil?
            redirect_to root_url
        end       
    end
    
    def create_bag_of_holding
        if !check_login()
            return
        end
        @bag = BagOfHolding.new(bag_params.merge(:user_id => session[:user]['id']))
        if @bag.save
          redirect_to "/inventory/bag_of_holding"
        else
          flash[:notice] = "Bag Creation Failed"
          flash[:color] = "text-danger"
          render "new_bag_of_holding"
        end
    end

    def delete_bag_of_holding
        if !check_login()
            return
        end

        # Temp check for items to ignore failure
        inventory = Inventory.where(bag_id: params['id'])
        if inventory.length > 0 
            flash[:notice] = "Bag Deletion Failed, items are still present. We will fix this later :P"
            flash[:color] = "text-danger"
        else
            deleted_bags = BagOfHolding.delete(params['id'])

            if deleted_bags < 1
                flash[:notice] = "Bag Deletion Failed"
                flash[:color] = "text-danger"
            else
                flash[:notice] = "Bag Deletion Complete"
                flash[:color] = "text-success"
            end
        end

        self.bag_of_holding
        return
    end

    def show_inventory
        if !check_login()
            return
        end
        if params[:id].nil?
            redirect_to "/inventory/bag_of_holding"
        end
        
        bags = BagOfHolding.where(user_id: session[:user]['id'], id: params[:id])

        if bags.nil? or bags[0].nil?
            flash[:notice] = "Could not find bag!"
            flash[:color] = "text-danger"
            self.bag_of_holding
            return
        end

        @title = bags[0]['name']
        @id = bags[0]['id']
        @inventory = Inventory.where(bag_id: bags[0]['id'])
    end

    def new_item
        @item = Inventory.new
    end
        
    def create_item
        if !check_login()
            return
        end
        @item = Inventory.new(item_params)
        if @item.save
            params['id'] = item_params['bag_id']
            self.show_inventory
            render "show_inventory"
        else
            flash[:notice] = "Item Failed"
            flash[:color] = "text-danger"
            render "show_inventory"
        end
    end

    def delete_item
        if !check_login()
            return
        end
        
        deleted_bags = Inventory.delete(params['id'])

        if deleted_bags < 1
            flash[:notice] = "Item Failed"
            flash[:color] = "text-danger"
        else
            flash[:notice] = "Item Complete"
            flash[:color] = "text-success"
        end

        #I should probably just make the params cleaner, but for now this is what it do
        params['id'] = params['bag_id']
        self.show_inventory
        render "show_inventory"
    end

  private

  def bag_params
    params.require(:bag_of_holding).permit(:name)
  end
  def item_params
    params.require(:inventory).permit(:itemName, :weight, :bag_id)
  end
end
