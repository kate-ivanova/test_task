'use strict'
Window.App.Views.SaleFormView = Backbone.View.extend
  el: $('.user-form')

  template: _.template($('#saleForm').html())

  events:
    'input input': 'changeData'
    'change select': 'changeData'
    'focusout input,select': 'changeData'
    'submit form': 'saveData'

  render: ->
    this.$el.html(this.template)

  changeData: (event) ->
    fieldName = $(event.currentTarget).attr('name')
    fieldVal = $(event.currentTarget).val()
    # birthday
    fieldVal += '.' if fieldName == 'birthDay'
    # radio
    fieldVal = '' if $(event.currentTarget).attr('type') == 'radio' and not $(event.currentTarget).prop('checked')
    # not valid
    notValid = this.model.preValidate(fieldName, fieldVal)
    if notValid
      $(event.currentTarget).siblings('.valid').html(notValid)
    else
      $(event.currentTarget).siblings('.valid').html('')
      if $(event.currentTarget).attr('type') == 'radio'
         $(event.currentTarget).parent().siblings().find('.valid').html('')
      this.model.set(fieldName, fieldVal)

  saveData: ->
    notValid = this.model.validate()
    if notValid
      for key of notValid
        $('[name=' + key + ']').siblings('.valid').html(notValid[key])
      $('.save-valid').addClass('err').html('Не все поля корректно заполнены')
    else
      localStorage.setItem('starSaleForm', JSON.stringify(this.model.attributes))
      $('.save-valid').removeClass('err').html('Успешно сохранено')
