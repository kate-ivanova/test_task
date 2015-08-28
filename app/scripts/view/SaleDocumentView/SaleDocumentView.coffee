'use strict'
Window.App.Views.SaleDocumentView = Backbone.View.extend
  el: $('.sale-document')

  template: _.template($('#saleDocument').html())

  initialize: ->
    this.listenTo(this.model, 'change', this.render)

  render: ->
    this.$el.html(this.template(this.model.toJSON()))
