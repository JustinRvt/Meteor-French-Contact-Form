# Basic French Contact Form for METEOR

![my French Contact Form](http://img15.hostingpics.net/pics/344155myFrenchContactForm.jpg)

## Installation

`meteor add justinrvt:contact-form`

**or**

Root of the project:

1. `mkdir packages && cd $_`
2. `git clone https://github.com/JustinRvt/Meteor-French-Contact-Form.git`

## Server side:

Coffeescript:

```javascript
Meteor.settings.myFrenchContactForm = emailTo: 'coucou@myfrenchmail.com'
```

**or**

Javascript:

```javascript
Meteor.settings.myFrenchContactForm = {
  emailTo: 'coucou@myfrenchmail.com'
};
```

## Client side:

Jade:

```html
+myFrenchContactForm
```

**or**

HTML:

```html
{{>myFrenchContactForm}}
```

## Next step

You're done. :two_hearts:





## Atmospherejs.com:

<https://atmospherejs.com/justinrvt/contact-form>
