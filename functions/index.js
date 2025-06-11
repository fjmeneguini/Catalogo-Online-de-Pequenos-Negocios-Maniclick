const { onDocumentCreated } = require("firebase-functions/v2/firestore");
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');

admin.initializeApp();

const GMAIL_USER = 'sandraalmeidamanicure@gmail.com';
const GMAIL_PASS = 'mjfx hvea umei tbyv'; // Senha de app do Gmail

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: GMAIL_USER,
    pass: GMAIL_PASS
  }
});

exports.sendAgendamentoEmail = onDocumentCreated("agendamentos/{id}", async (event) => {
  const data = event.data.data();
  const mailOptions = {
    from: `"ManiClick" <${GMAIL_USER}>`,
    to: GMAIL_USER,
    subject: 'Novo agendamento recebido!',
    text: `Novo agendamento:\n\nNome: ${data.nome}\nTelefone: ${data.telefone}\nData: ${data.data}\nHora: ${data.hora}`
  };
  await transporter.sendMail(mailOptions);
});
