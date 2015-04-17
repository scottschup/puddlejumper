PuddleJumper.Views.TripResultsIndexItem = Backbone.CompositeView.extend({
  template: JST['trips/index_item'],
  tagName: 'li',
  className: 'trip',

  events: {
    "click .select-btn > .btn": "openResView",
  },

  initialize: function (options) {
    this.fullTrip = options.fullTrip;
  },

  render: function () {
    var content = this.template({
      fullTrip: this.fullTrip
    });
    this.$el.html(content);
    return this;
  },

  openResView: function (ev) {
    var thesePlanets = {
      origin: PuddleJumper.planets.get(this.fullTrip.origin_id),
      destination: PuddleJumper.planets.get(this.fullTrip.destination_id)
    };

    var resView = new PuddleJumper.Views.TripResView({
      planets: thesePlanets,
      fullTrip: this.fullTrip
    });

    $("#modal").html(resView.render().$el);
  }
});
