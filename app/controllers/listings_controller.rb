class ListingsController < ApplicationController
 
  def lookup

	    @existing = Repository.where("full_name = ?", params[:full_repo_name]).first

	    if @existing == nil
	      begin
	        @repository = GithubRepo.new(params[:full_repo_name]).repository
	      rescue ArgumentError => e
	        @error_message = e.message
	      end 
	    else
	    	@repository = @existing
	    end
 
 				@listing = Listing.new
 				@listing.repository = @repository
	    	@list = List.new 
	    	@list.listings << @listing

	    if (!@repository || @repository.full_name == nil )
	      respond_to do |format|
	        format.html 
	        format.js { render :action => :add_form_error}
	      end 
	    else    
	      respond_to do |format|
	        format.html 
	        format.js
	      end 
	    end

  end 

end