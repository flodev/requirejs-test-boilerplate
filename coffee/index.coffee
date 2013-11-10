requirejs.config
    baseUrl: 'js/app'

    shim:
        'jquery':
            export: ['$']
    paths:
        'jquery': '../lib/jquery/jquery'

require(
    ['App'],
    (App)->
        app = new App
        app.start()
)
