// view
var SaleForm = Backbone.View.extend({
  el: $('.user-form'),
  template: _.template($('#saleForm').html()),
  events: {
    'input input': 'changeData',
    'change select': 'changeData',
    'focusout input,select': 'changeData',
    'submit form': 'saveData'
  },

  initialize: function() {
    this.render();
  },
  render: function() {
    this.$el.html(this.template);
  },
  changeData: function(event){
    var fieldName = $(event.currentTarget).attr('name');
    var fieldVal = $(event.currentTarget).val();
    //birthday
    if(fieldName == 'birthDay')
      fieldVal += '.';
    //radio
    if($(event.currentTarget).attr('type') == 'radio' && !$(event.currentTarget).prop('checked')){
      fieldVal = '';
    }

    var notValid = this.model.preValidate(fieldName, fieldVal);
    if(notValid){
      $(event.currentTarget).siblings('.valid').html(notValid);
    } else {
      $(event.currentTarget).siblings('.valid').html('');
      if($(event.currentTarget).attr('type') == 'radio')
         $(event.currentTarget).parent().siblings().find('.valid').html('');
      this.model.set(fieldName, fieldVal);
    }
    //
  },
  saveData: function(){
    var notValid = this.model.validate();
    if(notValid){
      for (var key in notValid) {
        $('[name=' + key + ']').siblings('.valid').html(notValid[key]);
      }
    } else {
      localStorage.setItem('starSaleForm', JSON.stringify(this.model.attributes));
      console.log(localStorage.getItem('form'));
    }
  },
  validateData: function(event){
    var fieldName = $(event.currentTarget).attr('name');
    var fieldVal = $(event.currentTarget).val();
    this.model.validate(fieldName);
  }
});
