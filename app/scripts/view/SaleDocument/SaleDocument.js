'use strict';
// view
App.Views.SaleDocumentView = Backbone.View.extend({
  el: $('.user-document'),
  template: _.template($('#saleDocument').html()),
  model: App.Models.SaleDataModel,

  initialize: function() {
    this.model.bind('change', this.render, this);
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
  }
});
