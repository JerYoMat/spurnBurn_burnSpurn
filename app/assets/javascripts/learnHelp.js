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
    console.log(status)
    console.log(data)
  })
}
