class Api::ItemsController < ApplicationController
  def index
    @item = item.all
    render "index.json.jb"
  end

  def weight
    @item = item.all
    render "item_weight.json.jb"
  end

  def show
    @input = params[:id]
    @item = item.find(@input)
    render "show.json.jb"
  end

  # ..
  def create
    @item = item.new(
      item_name: params[:item_name],
      item_description: params[:item_description],
      item_weight: params[:item_weight],
      item_quantity: params[:item_quantity],
      item_url: params[:item_url],
    )
    #item gets created and has a category id associated with it.
    # Check to see if user has a pack.
    # If user has a pack, add this item to it. If not, create pack.

    
    if @item.save #if item gets saved, create instance of a pack. Pack.new
      Pack.create(user_id: current_user.id,
                  item_id: @item.id)
      # @pack.save
      CategoryJoin.create(
        category_id: params[:category_id],
        item_id: @item.id,
      )
      # @category_join.save
      render "show.json.jb"
    else
      render json: { error: @item.errors.full_messages }
    end
  end

  def update
    input = params[:id]
    @item = item.find(input)
    @item.item_name = params[:item_name] || @item.item_name
    @item.item_description = params[:item_description] || @item.item_description
    @item.item_weight = params[:item_weight] || @item.item_weight
    @item.item_quantity = params[:item_quantity] || @item.item_quantity
    @item.item_url = params[:item_url] || @item.item_url

    if @item.save
      render "show.json.jb"
    else render json: { errors: @item.errors.full_messages }, status: 406     end
  end

  def destroy
    input = params[:id]
    @item = item.find(input)
    @item.delete
    render json: { message: "item deleted" }
  end
end
