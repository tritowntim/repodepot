class RepositoriesController < ApplicationController   

  def show
  	@repository = Repository.find(params[:id]) 
  end

  def index
  	@repositories = Repository.all
  end
end
