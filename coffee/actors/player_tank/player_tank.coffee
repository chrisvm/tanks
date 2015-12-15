PIXI = require 'pixi.js'


class PlayerTank extends PIXI.Container

	constructor: () ->
		# call constructor
		super()

		# create the graphics
		@graphics = new PIXI.Graphics()
		@addChild @graphics
		@pixelScale = 70

		@init()

	init: () ->
		g = @graphics

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
		scale = 0.70
		t = 0.15
		topVerts = (new PIXI.Point (v[0] * scale + t) * @pixelScale, (v[1] * scale + t) * @pixelScale for v in topVerts)
		g.lineStyle 3, 0xAAAAAA, 0.50
		g.beginFill 0x221122
		g.drawPolygon topVerts

module.exports = PlayerTank