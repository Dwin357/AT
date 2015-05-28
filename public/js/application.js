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


}) // closes doc.ready






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
