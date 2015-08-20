// view
var SaleDocument = Backbone.View.extend({
  el: $(".user-document"),
  template: _.template($('#saleDocument').html()),

  initialize: function() {
    this.model.bind('change', this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
  }
});
