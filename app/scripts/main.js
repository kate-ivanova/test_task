'use strict';
var App = {};
App.Views = {};
App.Models = {};
$(function() {
  _.extend(Backbone.Model.prototype, Backbone.Validation.mixin);
  //main
  var saleDataModel = new App.Models.SaleDataModel();
  var saleFormView = new App.Views.SaleFormView({model: saleDataModel});
  saleFormView.render();
  var saleDocumentView = new App.Views.SaleDocumentView({model: saleDataModel});
  saleDocumentView.render();
});
