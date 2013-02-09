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
//= require bootstrap
//= require_tree .


$(function() { 

    $('form').on('click', '.add_listing', function(event) {
        event.preventDefault()
        showAddListing()
    }) 

    $('.add-listing-container').on('click', '.cancel-add-listing', function(event) { 
      $('.add-listing').toggleClass('invisible-ui')
      $('#repo_name_or_url').val('')
    })

    $('form').on('click', '.remove_field', function(event) {
        event.preventDefault()
        $(event.target).prev('input[type=hidden]').val('1')
        $(event.target).closest('fieldset').hide()
        updateAllOrdering();
    })

    $('.alert').alert()

})

function updateAllOrdering() {
    $('.ordering').filter(function(i) { return $(this).parent().css('display') == 'block' }).each(function(i) { $(this).val(i+1) } )
}

function showAddListing() {
  $('.add-listing').toggleClass('invisible-ui')
  $('div.text-error').remove()
  $('.add-listing #repo_name_or_url').focus()
}

