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
                @$el = $ '<div class="player"></div>'
                @playground.add @$el
                @
)
