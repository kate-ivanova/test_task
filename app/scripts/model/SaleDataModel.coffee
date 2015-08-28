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

    birthdate: (value, attr, computedState) ->
        return 'Введите дату в формате дд.мм.гггг' unless not value or value.match(/^\d{2}\.\d{2}\.\d{4}$/)
        separatedValue = value.split('.')
        birthDay = +separatedValue[0]
        birthMonth = +separatedValue[1]
        birthYear = +separatedValue[2]
        testDate = new Date(birthYear, birthMonth-1, birthDay)
        return 'Некорректный день рождения' unless +testDate.getDate() is birthDay
        return 'Некорректный месяц рождения' unless (+testDate.getMonth() + 1) is birthMonth
        return 'Некорректный год рождения' unless +testDate.getFullYear() is birthYear

    sex:
      required: true
      msg: 'Выберите пол'

    country:
      required: true
      msg: 'Выберите страну'

    phone:
      required: false
      pattern: /^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$/
    email:
      required: false
      pattern: 'email'
