// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() { 

		$('form').on('click', '.remove_field', function(event) {
			event.preventDefault()
			console.log('.remove_field clicked')
			console.log($(event.target))
			$(event.target).prev('input[type=hidden]').val('1')
			$(event.target).closest('fieldset').hide()
		})

    $('form').on('click', '.add_fields', function(event) {
    	event.preventDefault()
    	console.log('.add_fields clicked')
    	var time = new Date().getTime()
    	var regexp = new RegExp($(event.target).data('id'),'g')
    	$(event.target).before($(this).data('fields').replace(regexp,time))
    })

    $('form').on('click', '.add_listing', function(event) {
    	event.preventDefault()
    	console.log('.add_fields clicked')
    	var time = new Date().getTime()
    	var b = $("#blank-listing").html()
    	var regexp = new RegExp($(b).data('id'),'g')
    	$(event.target).before($("#blank-listing").html().replace(regexp,time))
    })

	}
)

