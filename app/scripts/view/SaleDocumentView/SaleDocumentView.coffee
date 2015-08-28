'use strict'
Window.App.Views.SaleDocumentView = Backbone.View.extend
  el: $('.sale-document')
  template: _.template($('#saleDocument').html())
  initialize: ->
    this.model.bind('change', this.render, this)
  render: ->
    this.$el.html(this.template(this.model.toJSON()))
