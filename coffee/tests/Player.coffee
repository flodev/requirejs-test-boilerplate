define(
    [
        'Player'
    ], (Player)->
        ->
            describe 'Player test', ->

                player = null
                beforeEach -> player = new Player

                it 'renders', ->
                    expect(player.$el).toBeUndefined()
                    player.render()
                    expect(player.$el).toBeDefined()

                it 'screams', ->
                    player.render()
                    expect(player.$el.html()).toEqual ''
                    player.scream()
                    expect(player.$el.html()).toEqual 'waaaaaaaaaaaa'
)