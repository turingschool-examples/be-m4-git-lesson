class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end
end
