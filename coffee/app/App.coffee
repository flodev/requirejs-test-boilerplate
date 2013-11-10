
define(
    [
        'Player'
        'Zombie'
    ]
    (Player, Zombie)->
        class App
            constructor: ->
                @zombie = new Zombie()
                @player = new Player()
            start: ->
                @zombie.render()
                @player.render()
                @zombie.moan()
                @player.scream()
)
