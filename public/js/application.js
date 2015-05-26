$(document).ready(function() {
  var assignment = function(unit){
    $('#add_'+unit).click(function(event){
      event.preventDefault();
      var request = $.ajax({
        url: '/mission/add_'+unit,
        method: 'post'
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


$(document).ready(function() {
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var hours = date.getHours();
    var minutes = date.getMinutes();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var today = year + "-" + month + "-" + day;
    var now = hours + ":" + minutes;
    $("#startDate").attr("value", today);
    $("#startTime").attr("value", now);
    $("#returnDate").attr("value", today);
    $("#returnTime").attr("value", now);



});



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
