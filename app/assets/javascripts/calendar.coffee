class Calendar
  setRentalDate: (date) ->
    $("#rental_start_date_3i").val(date.day)
    $("#rental_start_date_2i").val(date.month)
    $("#rental_start_date_1i").val(date.year)

window.Calendar = new Calendar
