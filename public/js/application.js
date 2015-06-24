$(document).ready(function() {
  var assignment = function(unit){
    $('#add_'+unit).click(function(event){
      event.preventDefault();
      var request = $.ajax({
        url: '/missions/forms/add_'+unit,
        method: 'get'
      });

      request.done(function(response){
        console.log(response)
        $('#assignment_table').append(response)
      }); // closes response
    }); // closes .click
  };
  assignment('truck');
  assignment('passenger');
  assignment('trailer');
  assignment('payload');

  $.ajax({
    url:'/soldiers.json',
    method: 'get',
    dataType: 'json',
    error: function(err) {
      console.log(err);
    },
    success: function(res) {
      soldierList = res;
    }
  })


}) // closes doc.ready


// script from w3 to create a pop-up box, this should be used to
// implement the ck-in function for the TK
// it should grab: gal added(int), oil added(int), miles@return(int), keys_returned(ck-confirm)
// I imagine this being an ajax intercept which grabs the info and passes it along
/*<!DOCTYPE html>
<html>
<body>

<p>Click the button to demonstrate the prompt box.</p>

<button onclick="myFunction()">Try it</button>

<p id="demo"></p>

<script>
function myFunction() {
    var person = prompt("Please enter your name", "Harry Potter");

    if (person != null) {
        document.getElementById("demo").innerHTML =
        "Hello " + person + "! How are you today?";
    }
}
</script>

</body>
</html>*/








//     })
//     $("#create_mission input").each(function() {
//       // for $(this) element, shove the value into submitted_params
//       submitted_params[$(this).attr('name')] = $(this).val();
//     });

//   //   var ajax_params = {
//   //     url: '/mission',
//   //     method: "post",
//   //     data: submitted_params
//   //   }

//   //   $.ajax(ajax_params)
//   //   // post the form
//   //   // reset the form + give feedback



//   });
// });
