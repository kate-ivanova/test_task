'use strict'
Window.App.Views.SaleFormView = Backbone.View.extend
  el: $('.sale-form')

  template: _.template($('#saleForm').html())

  events:
    'input input': 'changeData'
    'change select': 'changeData'
    'focusout input,select': 'changeData'
    'submit form': 'saveData'

  render: ->
    this.$el.html(this.template)

  changeData: (event) ->
    attr = $(event.currentTarget)
    attrName = attr.attr('data-js-attr')
    attrVal = if attr.attr('type') == 'radio' and not attr.prop('checked') then '' else attr.val()
    attrValid = $(event.currentTarget).siblings('[data-js-attr-validation]')
    # birthday
    attrName += '.' if attrName == 'birthDay'
    validationFault = this.model.preValidate(attrName, attrVal)
    if validationFault
      attrValid.addClass('__fault').html(validationFault)
    else
      attrValid.removeClass('__fault').html('')
      this.model.set(attrName, attrVal)

  saveData: (event) ->
    formValid = $(event.currentTarget).siblings('[data-js-submit-validation]')
    validationFault = this.model.validate()
    if validationFault
      for key of validationFault
        $('[data-js-attr=' + key + ']').siblings('[data-js-attr-validation]').addClass('__fault').html(validationFault[key])
      formValid.addClass('__fault').html('Не все поля корректно заполнены')
    else
      localStorage.setItem('SaleForm', JSON.stringify(this.model.attributes))
      formValid.removeClass('__fault').html('Успешно сохранено')
