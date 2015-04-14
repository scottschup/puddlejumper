PuddleJumper.Views.TripResView = Backbone.View.extend({
  template: JST['trips/resView'],
  className: 'tripRes',

  initialize: function (trip) {
    this.trip = trip;
  },

  events: {
    "click .reserve": "reserveTrip",
    "click .close": "closeResView",
  },

  render: function () {
    $("#modal").removeClass("inactive")
    setTimeout(function () { $("#modal").addClass("active"); }, 100);
    var content = this.template({ trip: this.trip });
    this.$el.html(content)
    setTimeout(function () {
      $(".tripRes").addClass("active");
    }, 100);

    return this;
  },

  closeResView: function (ev) {
    $(".tripRes").removeClass("active");
    setTimeout(function () {
      $("#modal").removeClass("active");
      $('#modal').empty();
      setTimeout(function () { $("#modal").addClass("inactive"); }, 500);
    }, 200);
  },

  reserveTrip: function (ev) {
    // get trip ids, num of travs
    // add form for name
  }
});
