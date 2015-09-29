'use strict'
Window.App.Views.SaleFormView = MixinBackbone(Backbone.Epoxy.View).extend
  el: @$('[data-js-sale-form]')

  template: '#saleForm'

  events:
    'input input': 'onChangeData'
    'change select': 'onChangeData'
    'blur input,select': 'onChangeData'
    'submit form': 'onSubmit'

  render: ->
    @$('[data-js-attr=birthdate]').mask '99.99.9999'
    @$('[data-js-attr=phone]').mask '+7 (999) 999-99-99'

  onChangeData: (event) ->
    $changedField = @$(event.currentTarget)
    $validation = @$(event.currentTarget).siblings '[data-js-attr-validation-error]'
    fieldName = $changedField.attr 'data-js-attr'
    fieldVal = if $changedField.is('[type=radio]') and not $changedField.prop('checked') then '' else $changedField.val()
    validationError = @model.preValidate fieldName, fieldVal
    $validation.html validationError
    if !validationError
      @model.set fieldName, fieldVal

  onSubmit: (event) ->
    formValid = @$(event.currentTarget).find '[data-js-submit-validation-error]'
    validation = @model.validate()
    if validation
      for key of validation
        $('[data-js-attr=' + key + ']')
          .siblings '[data-js-attr-validation-error]'
          .addClass '__fault'
          .html validation[key]
      formValid
        .addClass '__fault'
        .html 'Не все поля корректно заполнены'
    else
      @model.submit()
      formValid.removeClass('__fault').html('Успешно сохранено')
