class Api::CategoryJoinController < ApplicationController
  def create
    @category_join = CategoryJoin.new(
      category_id: params[:category_id],
      gear_id: params[:gear_id],
    )
    @category_join.save
    render "show.json.jb"
  end

  def destroy
    input = params[:id]
    @category_join = CategoryJoin.find(input)
    @category_join.delete
    render json: { message: "category join instance deleted" }
  end

  def update
    input = params[:id]
    @category_join = CategoryJoin.find(input)
    @category_join.category_id = params[:category_id] || @category_join.category_id
    @category_join.gear_id = params[:gear_id] || @category_join.gear_id
  end
end
