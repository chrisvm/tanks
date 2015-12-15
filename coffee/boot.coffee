path = require 'path'
PIXI = require 'pixi.js'
$ = require 'jquery'
StaticGeom = require path.resolve './build/js/geom/static_geom'
PlayerTank = require path.resolve './build/js/actors/player_tank/player_tank'
assetsPath = path.resolve './assets'


class Boot

	constructor: () ->
		# add the renderer to the document body
		@renderer = PIXI.autoDetectRenderer 900, 600, backgroundColor: 0xFFFFFF
		@interaction = @renderer.plugins.interaction
		$('body').append @renderer.view

		# create scene graph
		@stage = new PIXI.Container()

		# add test map
		console.log process.cwd()
		testMapData = require path.join assetsPath, 'geom/test_map.json'
		staticG = new StaticGeom testMapData
		@stage.addChild staticG.graphics

		# add player tank
		pTank = new PlayerTank @interaction.mouse
		@stage.addChild pTank
		pTank.position.x = 200
		pTank.position.y = 150


		# start the anim loop
		@update()

	update: () ->
		# render the game
		@renderer.render @stage

		for c in @stage.children
			c.update?()

		# anim loop
		requestAnimationFrame () => @update()


new Boot()