'use strict'
Window.App.Views.SaleDocumentView = MixinBackbone(Backbone.Epoxy.View).extend
  el: @$('[data-js-sale-document]')

  template: '#saleDocument'

  ui:
    starName: '[data-js-star-name]'
    starSize: '[data-js-star-size]'
    starConstellation: '[data-js-star-constellation]'
    fullName: '[data-js-fullname]'
    birthdate: '[data-js-birthdate]'
    sex: '[data-js-sex]'
    country: '[data-js-country]'
    phone: '[data-js-phone]'
    email: '[data-js-email]'

  bindings:
    '@ui.starName': 'text: starName'
    '@ui.starSize': 'text: starSize'
    '@ui.starConstellation': 'text: starConstellation'
    '@ui.fullName': 'text: fullName'
    '@ui.birthdate': 'text: birthdate'
    '@ui.sex': 'text: sex'
    '@ui.country': 'text: country'
    '@ui.phone': 'text: phone'
    '@ui.email': 'text: email'
