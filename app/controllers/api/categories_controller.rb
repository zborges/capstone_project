class Api::CategoriesController < ApplicationController
  def create
    @category = Category.new(
      name: params[:name],
    )
    if @category.save
      render "show.json.jb"
    else
      render json: { error: "category add error" }
    end
  end

  def index
    @category = Category.all
    render "index.json.jb"
  end

  def destroy
    input = params[:id]
    @category = Category.find(input)
    @category.delete
    render json: { message: "category deleted" }
  end
end
