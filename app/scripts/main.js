$(function() {
  _.extend(Backbone.Model.prototype, Backbone.Validation.mixin);
  //main
  var saleData = new SaleData();
  saleData.on("invalid", function(model, error) {
    alert(error);
  });
  var saleForm = new SaleForm({model: saleData});
  var saleDocument = new SaleDocument({model: saleData});
});
