define(
    [
        'jquery'
    ], ->
        class Playground
            constructor: ->
                @$el = $ '.playground'
            add: (el)->
                @$el.append el
)