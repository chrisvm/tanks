path = require 'path'
PIXI = require 'pixi.js'
PIXI.Point.prototype = require(path.resolve './build/js/geom/vector').prototype
assetsDir = path.resolve '../assets'


load_resources = () ->
	res = {}
	loader = PIXI.loader
		.add 'tank_top', path.join assetsDir, 'sprites/tank/tank_Top.png'
		.add 'tank_threads', path.join assetsDir, 'sprites/tank/tank_Threads.png'
		.add 'tank_base', path.join assetsDir, 'sprites/tank/tank_Base.png'
		.add 'tank_barrel', path.join assetsDir, 'sprites/tank/tank_Barrel.png'
		.load (loader, resources) ->
			res.tank.threads = resources.tank_threads.texture
			res.tank.base = resources.tank_base.texture
			res.tank.top = resources.tank_top.texture
			res.tank.barrel = resources.tank_barrel.texture
	return res

module.exports = load_resources()