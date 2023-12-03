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

    private
    def item_params
        params.require(:item).permit(:exam_id, :question, choices_attributes: [:option, :correct])
    end
end