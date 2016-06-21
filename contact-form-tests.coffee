Meteor.settings.myFrenchContactForm = emailTo: 'acoucou@test.com'
emailData =
    name: 'Coucou Test'
    email: 'decoucou@test.com'
    subject: 'Coucou sujet test'
    message: 'Coucou message test'
dataSent = null
# Email sending stub
Email = send: (data) ->
    dataSent = data
    return
Tinytest.add 'Schema', (test) ->
    test.instanceOf Schema, Object
    return
Tinytest.add 'Schema - myFrenchContactForm', (test) ->
    test.instanceOf Schema.myFrenchContactForm, SimpleSchema
    return
Tinytest.add 'Schema - myFrenchContactForm - name', (test) ->
    test.instanceOf Schema.myFrenchContactForm._schema.name, Object
    return
Tinytest.add 'Schema - myFrenchContactForm - email', (test) ->
    test.instanceOf Schema.myFrenchContactForm._schema.email, Object
    return
Tinytest.add 'Schema - myFrenchContactForm - subject', (test) ->
    test.instanceOf Schema.myFrenchContactForm._schema.subject, Object
    return
Tinytest.add 'Schema - myFrenchContactForm - message', (test) ->
    test.instanceOf Schema.myFrenchContactForm._schema.message, Object
    return
if Meteor.isServer
    Tinytest.add 'Meteor - methods - sendEmail - exists', (test) ->
        test.include Meteor.server.method_handlers, 'sendEmail'
        return
    Tinytest.add 'Meteor - methods - sendEmail - fails on malformed data', (test) ->
        test.throws ->
            Meteor.call 'sendEmail', something: 'wrong'
            return
        return
    Tinytest.add 'Meteor - methods - sendEmail - sends email successfully', (test) ->
        dataSent = null
        Meteor.call 'sendEmail', emailData
        test.equal dataSent.from, emailData.email
        test.equal dataSent.to, Meteor.settings.myFrenchContactForm.emailTo
        test.include dataSent.text, emailData.subject
        test.include dataSent.text, emailData.message
        return
if Meteor.isClient
    Tinytest.add 'Meteor - templates - myFrenchContactForm - has a schema helper', (test) ->
        test.equal typeof Template.myFrenchContactForm.__helpers.get('myFrenchContactFormSchema'), 'function'
        test.equal Template.myFrenchContactForm.__helpers.get('myFrenchContactFormSchema')(), Schema.myFrenchContactForm
        return
