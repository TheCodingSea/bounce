class Calendar
  setRentalDate: (date) ->
    @clearPreviouslySelected()
    @setPreviouslySelected(date)
    @highlightSelectedDate(date)
    $("#rental_start_date_3i").val(date.day)
    $("#rental_start_date_2i").val(date.month)
    $("#rental_start_date_1i").val(date.year)

  clearPreviouslySelected: ->
    $(@previouslySelected).toggleClass("selected-date") if @previouslySelected

  setPreviouslySelected: (date) ->
    @previouslySelected = ".#{date.day}-#{date.month}"

  highlightSelectedDate: (date) ->
    $(".#{date.day}-#{date.month}").toggleClass("selected-date")

window.Calendar = new Calendar
