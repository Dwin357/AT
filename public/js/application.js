$(document).ready(function() {


//not sure why this doesn't work(no error);
// is the variable assignment swallowing the return?

  // var assignment = function(unit){
  //   $('#add_'+unit).click(function(event){
  //     event.preventDefault();
  //     var request = $.ajax({
  //       url: '/mission/add_'+unit,
  //       method: 'post'
  //     });
  //     request.done(function(response){
  //       $('assignment_table').append(response)
  //     }); // closes response
  //   }); // closes .click
  // };

  // assignment('truck');
  // assignment('passenger');
  // assignment('trailer');
  // assignment('load');


// lots of repitition here :: not sure how to refactor ajax, see above

  $('#add_truck').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/mission/add_truck',
      method: 'post'
    });
    request.done(function(response){
      $('#assignment_table').append(response)
    }); // closes response
  }); // closes .click


$('#add_passenger').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/mission/add_passenger',
      method: 'post'
    });
    request.done(function(response){
      $('#assignment_table').append(response)
    }); // closes response
  }); // closes .click


$('#add_trailer').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/mission/add_trailer',
      method: 'post'
    });
    request.done(function(response){
      $('#assignment_table').append(response)
    }); // closes response
  }); // closes .click


$('#add_load').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/mission/add_load',
      method: 'post'
    });
    request.done(function(response){
      $('#assignment_table').append(response)
    }); // closes response
  }); // closes .click




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
