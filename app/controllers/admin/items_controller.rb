class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end


end