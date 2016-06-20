Meteor.methods sendEmail: (data) ->
  check data, global.Schema.myFrenchContactForm
  text = 'Nom: ' + data.name + '\n\n' + 'Courriel: ' + data.email + '\n\n\n\n' + 'Sujet: ' + data.subject + '\n\n' + data.message
  @unblock()
  Email.send
    to: Meteor.settings.myFrenchContactForm.emailTo
    from: data.email
    subject: 'PinkPamplemousse.fr - Contact : ' + data.name
    text: text
  return
