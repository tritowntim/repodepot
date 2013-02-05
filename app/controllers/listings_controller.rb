class ListingsController < ApplicationController
 
  def lookup

  		# todo: determine if more appropriate place for repo lookup functionality than listings controller
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
 
 			# todo: move to static method, add notes
			@listing = Listing.new
			@listing.repository = @repository
    	@list = List.new 
    	@list.listings << @listing

    	# todo: use @error_message to determine success/not
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