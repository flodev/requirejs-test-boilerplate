define(
    [

    ], ->
        [
            path: 'Player', defineModules:
                'Playground': ->
                    define 'Playground', ->
                        class FakePlayground
                            add: -> console.log "mocked playground->add for Player has been called"

        ,
            path: 'Zombie', defineModules:
                'Playground': ->
                    define 'Playground', ->
                        class FakePlayground
                            add: -> console.log "mocked playground->add for Zombie has been called"
        ]
)