class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "#{@item.title} successfully created!"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "Item shares one or more of the same attributes as an already existing item!"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :status, :category, :image, :description)
  end
end