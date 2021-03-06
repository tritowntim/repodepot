class ListingsController < ApplicationController

	def initialize

		# new/blank list object in order to render form appropriately
		# class/static variable to avoid constantly recreating blank dummy list
		@@list = List.new 
		@@listing = Listing.new
		@@list.listings << @@listing
		
		super
	end

  def lookup

  		# look for existing repo by either name or URL
	    @existing = Repository.where("full_name = ? OR html_url = ?", params[:repo_name_or_url],  params[:repo_name_or_url]).first

	    if @existing == nil
	      begin
	        @repository = GithubRepo.new(params[:repo_name_or_url]).repository
	        @error_message = nil
	      rescue ArgumentError => e
	        @error_message = e.message
	      end 
	    else
	    	@repository = @existing
	    	@error_message = nil
	    end

		 	@@listing.repository = @repository	
 			@list = @@list

	    if @error_message == nil
	      respond_to do |format|
	        format.html 
	        format.js
	      end 
	    else    
	      respond_to do |format|
	        format.html 
	        format.js { render :action => :add_form_error}
	      end 
	    end
  end 
end