PIXI = require 'pixi.js'
TankTop = require './tank_top'


class PlayerTank extends PIXI.Container

	constructor: (@mouse) ->
		# call constructor
		super()

		# create the graphics
		@graphics = new PIXI.Graphics()
		@addChild @graphics
		@pixelScale = 70
		@platformScale = 0.75

		# add the tank top
		@tankTop = new TankTop @mouse
		s = (1.0 - @platformScale) / 2.0
		@tankTop.setPixelScale @pixelScale * @platformScale
		@tankTop.x = @pixelScale / 2.0
		@tankTop.y = @pixelScale / 2.0
		@addChild @tankTop

		@render()

	render: () ->
		g = @graphics
		g.clear()

		# draw the threads
		threadVerts = [[0, 1], [0.30, 1], [0.30, 0], [0, 0]]
		leftThreadVerts = ([v[0] * @pixelScale, v[1] * @pixelScale] for v in threadVerts)
		leftThreadVerts = (new PIXI.Point v[0], v[1] for v in leftThreadVerts)
		g.lineStyle 2, 0xAAAAAA, 0.56
		g.drawPolygon leftThreadVerts

		rightThreadVerts = ([(v[0] + 0.70) * @pixelScale, v[1] * @pixelScale] for v in threadVerts)
		rightThreadVerts = (new PIXI.Point v[0], v[1] for v in rightThreadVerts)
		g.lineStyle 2, 0xAAAAAA, 0.56
		g.drawPolygon rightThreadVerts

		# draw the top
		topVerts = [[0, 1], [1, 1], [1, 0], [0, 0]]
		scale = @platformScale
		t = (1.0 - @platformScale) / 2.0
		topVerts = (new PIXI.Point (v[0] * scale + t) * @pixelScale, (v[1] * scale + t) * @pixelScale for v in topVerts)
		g.lineStyle 3, 0xAAAAAA, 0.50
		g.beginFill 0x221122
		g.drawPolygon topVerts

		# render the tank top
		@tankTop.render()

	update: () ->
		for c in @children
			c.update?()

module.exports = PlayerTank