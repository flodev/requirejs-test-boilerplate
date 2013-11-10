define(
    [
        'Playground'
        'jquery'
    ], (Playground)->
        class Zombie
            constructor: ->
                @playground = new Playground

            moan: ->
                @$el.text 'uuuuuaaaarrr'
                @

            render: ->
                @$el = $ '<div class="zombie"></div>'
                @playground.add @$el
                @
)