class ListsController < ApplicationController
  def index
  	@lists = List.all
  end

  def show
  	@list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    @list.save
    redirect_to @list
  end

  def edit
  end
end
