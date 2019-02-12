function toggleLoginForm() {
  // toggle login form
  if ($('#login_target').is(':hidden')) {
    $('#login_target').slideDown(300);
    $(this).addClass('close');
  } else {
    $('#login_target').slideUp(600);
    $(this).removeClass('close');
  }
  // attach event listener to login form for submit
  $('#login_form').submit();
}; // end cl

function postLogin(event) {
  // prevent form from submitting the default way
  event.preventDefault();
  var values = $(this).serialize();
  var posting = $.post('/login', values);
  posting.done(function(data, status) {
    if (status === 201) {
      $('#login_form').remove()
    } else {
    }
    var post = data;
  })
  return false
}

function userTipData(data) {

  var tipHTML='';

  $.each(data,function(tip, tipInfo) {
    tipHTML+="<div class='card' style='width: 18rem;'>" 
    tipHTML+="<div class='card-body'>"
    tipHTML+="<h5 class='card-title'>" +tipInfo.title +" </h5>"
    tipHTML+="<p class='card-text'>"+tipInfo.description+"</p>"
    tipHTML+="<a href='#' class='btn btn-primary'>Go somewhere</a>"
    tipHTML+="</div><div class='card-footer text-muted'>2 days ago</div></div>"   
  }); // end of each
  
  // add finished HTML to page
  $('#info').html(tipHTML);
} 
