path = require 'path'
$ = require 'jquery'
PIXI = require 'pixi.js'
StaticGeom = require path.resolve './build/js/geom/static_geom'
PlayerTank = require path.resolve './build/js/actors/player_tank/player_tank'
PIXI.Point.prototype = require(path.resolve './build/js/geom/vector').prototype

assetsPath = path.resolve './assets'


class Boot

	constructor: () ->
		# add the renderer to the document body
		@renderer = PIXI.autoDetectRenderer 900, 600, backgroundColor: 0xFFFFFF
		@interaction = @renderer.plugins.interaction
		$('body').append @renderer.view

		# load resources
		loader = PIXI.loader
			.add 'tank_top', path.join assetsDir, 'sprites/tank/tank_Top.png'
			.add 'tank_threads', path.join assetsDir, 'sprites/tank/tank_Threads.png'
			.add 'tank_base', path.join assetsDir, 'sprites/tank/tank_Base.png'
			.add 'tank_barrel', path.join assetsDir, 'sprites/tank/tank_Barrel.png'
			.load (loader, resources) =>
				# cache resources
				@res.tank.threads = resources.tank_threads.texture
				@res.tank.base = resources.tank_base.texture
				@res.tank.top = resources.tank_top.texture
				@res.tank.barrel = resources.tank_barrel.texture

				# create scene graph
				@stage = new PIXI.Container()

				# add test map
				testMapData = require path.join assetsPath, 'geom/test_map.json'
				staticG = new StaticGeom testMapData
				# TODO: change StaticGeom to inherit from PIXI.Container
				@stage.addChild staticG.graphics

				# add player tank
				@res.mouse = @interaction.mouse
				pTank = new PlayerTank @res
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