'use strict';
// model
App.Models.SaleDataModel = Backbone.Model.extend({
  defaults: {
    starName: '',
    starSize: '',
    starConstellation: '',
    firstName: '',
    lastName: '',
    patronymic: '',
    birthdate: '',
    sex: '',
    country: '',
    phone: '',
    email: ''
  },
  validation: {
    starName: {
      required: true,
      msg: 'Введите имя звезды'
    },
    starSize: {
      required: true,
      msg: 'Выберите величину звезды'
    },
    starConstellation: {
      required: true,
      msg: 'Выберите созвездие'
    },
    firstName: {
      required: true,
      msg: 'Введите имя'
    },
    lastName: {
      required: true,
      msg: 'Введите фамилию'
    },
    patronymic: {
      required: true,
      msg: 'Введите отчество'
    },
    birthdate: function(val){
      if(!val){
        return 'Введите дату рождения';
      }
      var bd = val.split('.');
      if(bd.length != 3 || bd[0].length != 2 || bd[1].length != 2 || bd[2].length != 4){
        return 'Формат даты рождения должен быть дд.мм.гггг!';
      }
      var curDate = new Date(bd[2], +bd[1] - 1, bd[0]);
      if (curDate.getDate() != bd[0]){
        return 'Некорректный день рождения';
      }
      if (+curDate.getMonth() + 1 != +bd[1]){
        return 'Некорректный месяц рождения';
      }
      if (curDate.getFullYear() != bd[3]){
        return 'Некорректный год рождения';
      }
    },
    sex: {
      required: true,
      msg: 'Выберите пол'
    },
    country: {
      required: true,
      msg: 'Выберите страну'
    }
  },
  initialize: function(){
  }
});
