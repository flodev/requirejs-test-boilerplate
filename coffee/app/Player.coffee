define(
    [
        'Playground'
        'jquery'
    ], (Playground)->
        class Player
            constructor: ->
                @playground = new Playground

            scream: ->
                @$el.text 'waaaaaaaaaaaa'
                @

            render: ->
                @$el = $ '<div class="zombie"></div>'
                @playground.add @$el
                @
)