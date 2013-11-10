define(
    [
        'Zombie'
    ], (Zombie)->
        ->
            describe 'Zombie test', ->

                zombie = null
                beforeEach -> zombie = new Zombie

                it 'renders', ->
                    expect(zombie.$el).toBeUndefined()
                    zombie.render()
                    expect(zombie.$el).toBeDefined()

                it 'moans', ->
                    zombie.render()
                    expect(zombie.$el.html()).toEqual ''
                    zombie.moan()
                    expect(zombie.$el.html()).toEqual 'uuuuuaaaarrr'
)