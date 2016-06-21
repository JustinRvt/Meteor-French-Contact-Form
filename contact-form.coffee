global.Schema = global.Schema or {}
Schema.myFrenchContactForm = new SimpleSchema(
    name:
        type: String
        label: 'Votre nom'
        max: 64
    email:
        type: String
        regEx: SimpleSchema.RegEx.Email
        label: 'Votre courriel'
    subject:
        type: String
        label: 'Sujet'
        max: 256
    message:
        type: String
        label: 'Message'
        max: 1024)
