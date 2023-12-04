class ItemController < ApplicationController

    def create
        item = Item.new(item_params)
        if item.save
            flash[:success] = "Item created successfully"
            redirect_back fallback_location: root_path
        else
            flash.now[:error] = "Item creation failed."
        end
    end

    def update
        item =Item.find(params[:id])
        if item.update(item_params)
            flash[:success] = "Item updated successfully"
            redirect_back fallback_location: root_path
        else
            flash.now[:error] = "Item update failed."
        end
    end

    private
    def item_params
        params.require(:item).permit(:exam_id, :question, choices_attributes: [:id, :option, :correct])
    end
end