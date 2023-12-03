class ItemController < ApplicationController

    def create
        item = Item.new(params[:item])
        if item.save
            flash[:success] = "Item created successfully"
            redirect_back fallback_location: root_path
        else
            flash[:error] = "Item creation failed."
            redirect_back fallback_location: root_path 
        end
    end

end