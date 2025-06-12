// Faz o campo _replyto receber o valor do campo email antes de enviar
document.getElementById('form-contatenos').addEventListener('submit', function(e) {
  var email = document.getElementById('email').value;
  this.querySelector('input[name="_replyto"]').value = email;
});