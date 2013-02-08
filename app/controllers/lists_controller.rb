class ListsController < ApplicationController

  before_filter :check_authentication, :only =>[:new, :create, :edit, :update]

  def all
    @lists = List.all
    @lists_title = "All Lists"
    render :action => :index
  end

  # default /lists to only those owned by logged in user
  def index
    if current_user
    	@lists = List.where :user_id => current_user.id 
      @lists_title = "Lists by #{current_user.name}"
    else 
      redirect_to all_lists_path
    end
  end

  def show
  	@list = find_list
  end

  def new
    @list = List.new
    @blank_listing = Listing.new
    @blank_listing.list_id = @list.id
  end

  def create
    @list = List.new(params[:list])
    @list.user_id = current_user.id
    if @list.save
      redirect_to @list
    else
      render :action => :new
    end
  end

  def edit
    @list = find_list
    if authorized_owner?(@list) 
      @blank_listing = Listing.new
      @blank_listing.list_id = @list.id
    else
      handle_unauthorized
    end
  end

  def update
    @list = find_list
    if authorized_owner?(@list) 
      if @list.update_attributes(params[:list])
        redirect_to @list
      else
        render :edit
      end
    else
      handle_unauthorized
    end
  end

  private 
    def find_list
      List.find(params[:id])
    end

    def handle_unauthorized
      redirect_to @list, :alert => "Only the list owner <strong>#{@list.user.name}</strong>  may change list contents.".html_safe
    end
end
