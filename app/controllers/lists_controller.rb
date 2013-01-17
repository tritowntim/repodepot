class ListsController < ApplicationController
  def index
  	@lists = List.all
  end

  def show
  	@list = find_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    @list.save
    # todo if save fails
    redirect_to @list
  end

  def edit
    @list = find_list
  end

  def update
    @list = find_list
    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render :edit
    end
  end

  private 
    def find_list
      List.find(params[:id])
    end
end
