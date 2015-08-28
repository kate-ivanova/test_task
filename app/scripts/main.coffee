'use strict'
saleDataModel = new Window.App.Models.SaleDataModel()
saleDocumentView = new Window.App.Views.SaleDocumentView({model: saleDataModel})
saleFormView = new Window.App.Views.SaleFormView({model: saleDataModel})
saleDocumentView.render()
saleFormView.render()
console.log 'main.coffee'
