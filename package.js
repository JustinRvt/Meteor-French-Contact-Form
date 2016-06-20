Package.describe({
    name: 'justinrvt:contact-form',
    summary: 'French contact form for METEOR',
    version: '1.3.3'
    git: 'https://github.com/JustinRvt/Meteor-French-Contact-Form'
});

Package.onUse(function(api) {
    api.versionsFrom('1.3.3');
    api.use('email', 'server');
    api.use([
        "templating",
        "mquandalle:jade@0.4.9"
    ], "client");
    api.use('aldeed:autoform@5.3.0');
    api.use('coffeescript');
    api.addFiles('contact-form.coffee');
    api.addFiles([
            'client/views/contact-form.jade',
            'client/views/contact-form.coffee'
        ],
        'client');
    api.addFiles('server/contact-form.coffee', 'server');
});

Package.onTest(function(api) {
    api.use('tinytest');
    api.use('templating', 'client');
    api.use('aldeed:autoform@5.3.0');
    api.addFiles('contact-form.coffee');
    api.addFiles([
      'client/views/contact-form.jade',
      'client/views/contact-form.coffee'
    ],
    'client');
    api.addFiles('server/contact-form.coffee', 'server');
    api.addFiles('contact-form-tests.coffee');
});
