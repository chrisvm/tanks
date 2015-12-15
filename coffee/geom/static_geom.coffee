PIXI = require 'pixi.js'

class StaticGeom
	constructor: (options) ->
		@name = options.name
		@geom = options.geom
		@graphics = new PIXI.Graphics()
		@render()

	render: () ->
		g = @graphics
		g.clear()

		for geom in @geom
			g.moveTo geom[0][0], geom[0][1]
			for index in [1...geom.length]
				g.lineTo geom[index][0], geom[index][1]
			g.endFill()

module.exports = StaticGeom