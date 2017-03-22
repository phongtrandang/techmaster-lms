const ready = function() {
  $(".btn-enrollment").click(function() {
    // console.log(this.getAttribute("data-id"))
    let courseId = this.getAttribute("data-id")
    $.ajax({
      url: 'courses/' + courseId + '/enroll',
      dataType: 'script',
      method: 'post',
      data: {},
      success: function(data) {
        console.log('success')
        console.log(data)
      },
      error: function(error) {
        console.log(error)
      },
    });
    });
};

$(document).on("turbolinks:load", ready);