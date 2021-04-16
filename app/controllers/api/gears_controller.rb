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

  def create
    @gear = Gear.new(
      item_name: params[:name],
      item_description: params[:item_description],
      item_weight: params[:item_weight],
      item_quantity: params[:quantity],
    )
    @gear.save
    render "show.json.jb"
  end

  def update
    input = params[:id]
    @gear = Gear.find(input)
    @gear.name = params[:item_name] || @gear.item_name
    @gear.item_description = params[:item_description] || @gear.item_description
    @gear.item_weight = params[:item_weight] || @gear.item_weight
    @gear.quantity = params[:item_quantity] || @gear.item_quantity
    @gear.item_url = params[:item_url] || @gear.item_url
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
