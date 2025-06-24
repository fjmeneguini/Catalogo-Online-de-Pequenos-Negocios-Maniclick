// ============================================================
// SCRIPT DE FORMULÁRIO DE CONTATO - ManiClick
// ============================================================
// Este script garante que o campo _replyto do formulário receba
// o valor digitado no campo de e-mail antes do envio.
// ============================================================
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