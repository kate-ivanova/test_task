'use strict'
Window.App.Models.SaleDataModel = Backbone.Model.extend
  defaults:
    starName: ''
    starSize: ''
    starConstellation: ''
    firstName: ''
    lastName: ''
    patronymic: ''
    birthdate: ''
    sex: ''
    country: ''
    phone: ''
    email: ''

  validation:
    starName:
      required: true
      msg: 'Введите имя звезды'

    starSize:
      required: true
      msg: 'Выберите величину звезды'

    starConstellation:
      required: true
      msg: 'Выберите созвездие'

    firstName:
      required: true
      msg: 'Введите имя'

    lastName:
      required: true
      msg: 'Введите фамилию'

    patronymic:
      required: true
      msg: 'Введите отчество'

    birthdate: (val) ->
      return 'Введите дату рождения' unless val
      bd = val.split('.')
      return 'Формат даты рождения должен быть дд.мм.гггг!' if bd.length isnt 3 or bd[0].length isnt 2 or bd[1].length isnt 2 or bd[2].length isnt 4
      curDate = new Date(bd[2], +bd[1] - 1, bd[0])
      return 'Некорректный день рождения' unless curDate.getDate() != bd[0]
      return 'Некорректный месяц рождения' unless (+curDate.getMonth() + 1) is (+bd[1])
      return 'Некорректный год рождения' unless curDate.getFullYear() != bd[2]

    sex:
      required: true
      msg: 'Выберите пол'

    country:
      required: true
      msg: 'Выберите страну'
