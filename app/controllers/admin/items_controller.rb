class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

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
      redirect_to admin_items_path
    else
      flash[:notice] = "One or more of your fields are invalid!"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :status, :category_id, :image, :description)
  end
end
