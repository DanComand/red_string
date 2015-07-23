class ItemsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  		redirect_to items_url
  	else
  		render :new
  	end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :lent_to, :date_lent, :date_due, :phone, :email)
  end
end