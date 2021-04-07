class Api::PacksController < ApplicationController
  def index
    @packs = Pack.all
    render "index.json.jb"
  end

  def show
    @input = params[:id]
    @packs = Pack.find(@input)
  end

  def create
    @pack = Pack.new(
      user_id: params[:user_id],
      gear_id: params[:gear_id],
    )
  end

  def update
    @p
  end
end
