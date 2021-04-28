class Api::GearsController < ApplicationController
  def index
    @gear = Gear.all
    render "index.json.jb"
  end

  def show
    @input = params[:id]
    @gear = Gear.find(@input)
    render "show.json.jb"
  end

  # ..
  def create
    @gear = Gear.new(
      item_name: params[:item_name],
      item_description: params[:item_description],
      item_weight: params[:item_weight],
      item_quantity: params[:item_quantity],
      item_url: params[:item_url],
      item_category: params[:item_category],
    )
    if @gear.save #if gear gets saved, create instance of a packk. Pack.new
      @pack = Pack.new(user_id: current_user.id,
                       gear_id: @gear.id)
      @pack.save
      render "show.json.jb"
    else
      render json: { error: "Gear add error" }
    end
  end

  def update
    input = params[:id]
    @gear = Gear.find(input)
    @gear.item_name = params[:item_name] || @gear.item_name
    @gear.item_description = params[:item_description] || @gear.item_description
    @gear.item_weight = params[:item_weight] || @gear.item_weight
    @gear.item_quantity = params[:item_quantity] || @gear.item_quantity
    @gear.item_url = params[:item_url] || @gear.item_url
    @gear.category_id = params[:category_id] || @gear.category_id
    if @gear.save
      render "show.json.jb"
    else render json: { errors: @gear.errors.full_messages }, status: 406     end
  end

  def destroy
    input = params[:id]
    @gear = Gear.find(input)
    @gear.delete
    render json: { message: "gear deleted" }
  end
end
