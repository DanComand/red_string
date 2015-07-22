class ItemsController < ApplicationController

  def index
    @items = Items.all
  end

  def show
    @item = Items.find(params[:id])
  end

  def new
    @item = Items.new
  end

  def edit
    @item = Items.find(params[:id])
  end

  def create
    @item = Items.new(items_params)

    if @item.save
      redirect_to items_url
    else
      render :new
    end
  end

  def update
    @item = Items.find(params[:id])

    if @item.update_attributes(items_params)
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Items.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def items_params
    params.require(:items).permit(:name, :lent_to, :date_lent, :date_due, :phone, :email)
  end
end