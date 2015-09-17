'use strict'
Window.App.Views.SaleDocumentView = Backbone.View.extend
  el: $('[data-js-sale-document]')

  template: _.template($('#saleDocument').html())

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))
