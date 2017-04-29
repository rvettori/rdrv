$(function(){
  Vue.directive('digitsonly', (el, binding) => {
    if (/[\d\.]+/i.test(el.value)) {
      console.log('ok');
    } else {
      var newValue = el.value.replace(/[a-zA-Z]+/ig, '');
      el.value = newValue;
      console.log('should fix', newValue);
      binding.value = el.value;
    }
  });

  var vmForm = new Vue({
    el:'#vue-contacts-form',

    data:{
      zipcode:'',
      zipcode_error:false,
      occupation:'',
      occupation_error:false,
      viacep:{}
    },

    methods: {
      occupation_click: function(){
        bootbox.prompt("New Occupation", function(result){ 

          var pdata = {name: result };

          jQuery.ajax({
            type: "POST",
            url: '/occupations',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(pdata),
            success: function(resp, status, xhr){
              self.viacep = {};
              if ($('#contact_occupation_id option[value='+ resp.id +']').length == 0) {
                $('#contact_occupation_id').append('<option value="'+ resp.id +'">'+ resp.to_s +'</option>');
              }
              $('#contact_occupation_id').val(resp.id);
            },
            error: function(){              
              console.log();
            }
          });
          
        });
      },
      zipcode_add: function(){
        var self = this;
        // insert on database
        var pdata = {
          code: self.viacep.cep, 
          street: self.viacep.logradouro, 
          neighbordhood: self.viacep.bairro, 
          city: self.viacep.localidade, 
          state: self.viacep.uf
        };

        jQuery.ajax({
          type: "POST",
          url: '/zipcodes',
          dataType: "json",
          contentType: "application/json",
          data: JSON.stringify(pdata),
          success: function(resp, status, xhr){
            self.viacep = {};
            if ($('#contact_zipcode_id option[value='+ resp.id +']').length == 0) {
              $('#contact_zipcode_id').append('<option value="'+ resp.id +'">'+ resp.to_s +'</option>');
            }
            $('#contact_zipcode_id').val(resp.id);
            $('.zipcode-modal').modal('hide');
          },
          error: function(){
            // alert('Sorry');
          }
        });
        
      },
      zipcode_search: function(){
        var self = this;
        $.getJSON("//viacep.com.br/ws/"+ (self.zipcode || '00000000') +"/json/?callback=?", function(data) {
          if (!("erro" in data)) {
            self.viacep = data;
            self.zipcode_error = false
          } else {
            self.zipcode_error = true
          }
        });        
      }
    },

    mounted: function() {
      var self = this;    
      self.$nextTick(function() {
        $('#zipcode-label').append('&nbsp;<a href="#" data-toggle="modal" data-target=".zipcode-modal"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>');
        $('#occupation-label').append('&nbsp;<a href="#" data-toggle="modal" data-target=".occupation-modal"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>');        
      });
    }
  });  


  var vmList = new Vue({
    el:'#vue-contacts-list',

    data:{},

    methods: {
    },

    mounted: function() {
      var self = this;    
      self.$nextTick(function() {});
    }
  });


  var btn_apply_toggle = function() {
      $('#btn-apply').hide()  
    $('#contact_search .field').each(function(){
      $('#btn-apply').show()  
    });
  };

  btn_apply_toggle();

  $(document).on('click', '.remove_fields', function(event) {
    $(this).closest('.field').remove();
    btn_apply_toggle();
    return event.preventDefault();
  });

  $(document).on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    btn_apply_toggle();
    event.preventDefault();
  });

  

});