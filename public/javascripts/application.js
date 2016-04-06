// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $('#user_nbfilms').focus(function(event){
    event.preventDefault();
    $('div.books').toggle(true);
  });
}); 