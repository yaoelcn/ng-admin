# Upgrade to 1.0

## [BC Break] ng-admin now attaches to a named view

Ng-admin used to attach to the following element in your main `index.html`:

```js
<div ui-view></div>
```

Starting with 1.0, you now have to name the ui-view of ng-admin:

```js
<div ui-view="ng-admin">
```

Not upgrading your `index.html` will result in a blank page.

## [BC Break] Custom pages must use declare 'ng-admin' as parent instead of 'main'

If you added [custom pages](doc/Custom-pages.md), you probably declared a route with a `parent: 'main'`. The main view isn't named 'parent' anymore, but 'ng-admin'. Therefore, all the state definitions for custom pages must be updated:

```js
// from
myApp.config(function ($stateProvider) {
    $stateProvider.state('send-post', {
        parent: 'main',
        url: '/sendPost/:id',
        params: { id: null },
        controller: sendPostController,
        controllerAs: 'controller',
        template: sendPostControllerTemplate
    });
});

// to
myApp.config(function ($stateProvider) {
    $stateProvider.state('send-post', {
        parent: 'ng-admin', // <= this has changed
        url: '/sendPost/:id',
        params: { id: null },
        controller: sendPostController,
        controllerAs: 'controller',
        template: sendPostControllerTemplate
    });
});
```
