PIXI = require 'pixi.js'
Vector = require '../../geom/vector'

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
		dirX = @mouse.global.x - this.x
		dirY = @mouse.global.y - this.y
		dir = @toGlobal @position
		console.log dir
		
module.exports = TankTop