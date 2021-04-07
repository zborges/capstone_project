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
      name: params[:name],
      item_description: params[:item_description],
      item_weight: params[:item_weight],
      quantity: params[:quantity],
    )
    @gear.save
    render "show.json.jb"
  end

  # def update
  #   @gear = Gear.find(id: params [:id])
  #   @gear.name = params[:name] || @gear.name
  #   @gear.item_description = params[:item_description] || @gear.item_description
  #   @gear.item_weight = params[:item_weight] || @gear.item_weight
  #   @gear.quantity = params[:quantity] || @gear.quantity
  #   if @gear.save
  #     render "show.json.jb"
  #   else render json: {errors: @gear.errors.full_messages }, status: 406
  #   end
  # end

  def destroy
    input = params[:id]
    @gear = Gear.find(input)
    @gear.delete
    render json: { message: "gear deleted" }
  end
end
