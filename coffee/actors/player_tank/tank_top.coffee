PIXI = require 'pixi.js'
Vector = require '../../geom/vector'
_ = require 'underscore'
PIXI.Point.prototype = Vector.prototype

class TankTop extends PIXI.Container

	constructor: (@mouse) ->
		super()

		@graphics = new PIXI.Graphics()
		@addChild @graphics
		@buttWidth = 0.46
		@buttHeight = 0.40
		@noseWidth = 0.20

		@_pixelScale = 0
		@_verts = []
		@setPixelScale 70

	render: () ->
		g = @graphics
		g.clear()
		g.lineStyle 1.5, 0x999999, 0.68
		g.beginFill 0x888888
		g.drawPolygon @_verts

	setPixelScale: (ps) ->
		if ps?
			@_pixelScale = ps
			@graphics.pivot = new PIXI.Point ps * 0.5, ps * 0.5
			@setVerts()
			@render()
		else
			return @pixelScale

	setVerts: () ->
		bw = @buttWidth
		bh = @buttHeight
		nw = @noseWidth
		@_verts = [
			[bw / 2.0, 1.0], [1.0 - (bw/2.0), 1.0],
			[1.0 - (bw / 2.0), 1.0 - bh], [0.5 + (nw/2.0), 0],
			[0.5 - (nw/2.0), 0], [bw/2.0, 1.0 - bh]
		]
		@_verts = (new PIXI.Point v[0] * @_pixelScale, v[1] * @_pixelScale for v in @_verts)

	update: () ->
		# create the vector
		mPos = new PIXI.Point @mouse.global.x, @mouse.global.y

		# sub the top's position to align with center of tank
		mPos.sub(@position)

		gPos = @toLocal @position
		#gPos.neg()

		# get the direction in relation to the mouse
		tDir = gPos.clone().sub mPos

		@rotation = Math.PI / 2
		#@rotation = tDir.rad()

		# set the direction
		console.log mPos, gPos, tDir, "radians(#{tDir.rad()})"


module.exports = TankTop