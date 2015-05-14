$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // hijack the form submit
  $(document).on("submit", "#create_mission", function(event){
    event.preventDefault();

    // grab the values
    var submitted_params = {}
    $("#create_mission input").each(function() {
      // for $(this) element, shove the value into submitted_params
      submitted_params[$(this).attr('name')] = $(this).val();
    });

    var ajax_params = {
      url: '/mission',
      method: "post",
      data: submitted_params
    }

    $.ajax(ajax_params)
    // post the form
    // reset the form + give feedback



  });
});
