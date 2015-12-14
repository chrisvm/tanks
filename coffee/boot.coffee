path = require 'path'
PIXI = require 'pixi.js'
$ = require 'jquery'
StaticGeom = require path.resolve './build/js/geom/static_geom'
assetsPath = path.resolve './assets'


class Boot
	constructor: () ->
		# add the renderer to the document body
		@renderer = PIXI.autoDetectRenderer 900, 600, backgroundColor: 0xFFFFFF
		$('body').append @renderer.view

		# create scene graph
		@stage = new PIXI.Container()

		# add test map
		console.log process.cwd()
		testMapData = require path.join assetsPath, 'geom/test_map.json'
		staticG = new StaticGeom testMapData
		@stage.addChild staticG.graphics

		# start the anim loop
		@update()

	update: () ->
		# render the game
		@renderer.render @stage

		# anim loop
		requestAnimationFrame () => @update()


new Boot()