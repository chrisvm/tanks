path = require 'path'
PIXI = require 'pixi.js'
PIXI.Point.prototype = require('../../geom/vector').prototype
resources = require '../../loader'


class PlayerTank extends PIXI.Container

	constructor: (@res) ->
		# call constructor
		super()

		# get assets dir
		assetsDir = path.resolve '../../assets'

		# create the sprites
		@threads = new PIXI.Sprite resources.tank.threads
		@top = new PIXI.Sprite resources.tank.top
		@base = new PIXI.Sprite resources.tank.base
		@barrel = new PIXI.Sprite resources.tank.barrel

		# get reference to mouse from resources
		@mouse = @res.mouse

		# add created sprites to self container
		toAdd = [@threads, @top, @base, @barrel]
		for sprite in toAdd
			# set the anchor point to the middle of the texture
			sprite.anchor 0.5, 0.5

			# add sprite to container
			@addChild sprite

	update: () ->
		for c in @children
			c.update?()

module.exports = PlayerTank