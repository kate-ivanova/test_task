'use strict'
Window.App.Views.SaleFormView = Backbone.View.extend
  el: $('.sale-form')

  template: _.template($('#saleForm').html())

  events:
    'input input': 'changeData'
    'change select': 'changeData'
    'blur input,select': 'changeData'
    'submit form': 'saveData'

  render: ->
    this.$el.html(this.template)
    $('[data-js-attr=birthdate]').mask('99.99.9999')
    $('[data-js-attr=phone]').mask('+7 (999) 999-99-99')

  changeData: (event) ->
    attr = $(event.currentTarget)
    attrName = attr.attr('data-js-attr')
    attrVal = if attr.is('[type=radio]') and not attr.prop('checked') then '' else attr.val()
    attrValid = $(event.currentTarget).siblings('[data-js-attr-validation]')
    validation = this.model.preValidate(attrName, attrVal)
    if validation
      attrValid.addClass('__fault').html(validation)
    else
      attrValid.removeClass('__fault').html('')
      this.model.set(attrName, attrVal)


  saveData: (event) ->
    console.log event
    formValid = $(event.currentTarget).find('[data-js-submit-validation]')
    console.log formValid
    validation = this.model.validate()
    if validation
      for key of validation
        $('[data-js-attr=' + key + ']').siblings('[data-js-attr-validation]').addClass('__fault').html(validation[key])
      formValid.addClass('__fault').html('Не все поля корректно заполнены')
    else
      localStorage.setItem('SaleForm', JSON.stringify(this.model.attributes))
      formValid.removeClass('__fault').html('Успешно сохранено')
