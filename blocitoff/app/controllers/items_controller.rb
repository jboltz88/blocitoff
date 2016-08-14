class ItemsController < ApplicationController
  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    
    if @item.save
      flash[:notice] = "Item was saved successfully."
      redirect_to [@user]
    else
      flash[:alert] = "There was an error saving the item."
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end



  private

  def item_params
    params.require(:item).permit(:name)
  end
end
