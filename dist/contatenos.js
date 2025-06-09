// Faz o campo _replyto receber o valor do campo email antes de enviar
document.addEventListener('DOMContentLoaded', function() {
  var form = document.getElementById('form-contatenos');
  if (form) {
    form.addEventListener('submit', function(e) {
      var email = document.getElementById('email').value;
      var replyto = this.querySelector('input[name="_replyto"]');
      if (replyto) replyto.value = email;
    });
  }
});