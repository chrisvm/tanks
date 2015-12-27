###
# @class Vector
# @constructor
# @param x {Number} position of the point
# @param y {Number} position of the point
###
class Vector
	constructor: (x, y) ->
		@x = x or 0
		@y = y or 0

	clone: ->
		return new Vector(@x, @y)

	copy: (v) ->
		@set v.x, v.y

	add: (v) ->
		@x += v.x
		@y += v.y
		this

	sub: (v) ->
		@x -= v.x
		@y -= v.y
		this

	invert: (v) ->
		@x *= -1
		@y *= -1
		this

	multiplyScalar: (s) ->
		@x *= s
		@y *= s
		this

	equals: (p) ->
		if p.x == @x and p.y == @y
			return trues
		return false

	divideScalar: (s) ->
		if s == 0
			@x = 0
			@y = 0
		else
			invScalar = 1 / s
			@x *= invScalar
			@y *= invScalar
		this

	dot: (v) ->
		@x * v.x + @y * v.y

	length: (v) ->
		Math.sqrt @x * @x + @y * @y

	lengthSq: ->
		@x * @x + @y * @y

	normalize: ->
		@divideScalar @length()

	neg: ->
		@multiplyScalar -1

	distanceTo: (v) ->
		Math.sqrt @distanceToSq(v)

	distanceToSq: (v) ->
		dx = @x - (v.x)
		dy = @y - (v.y)
		dx * dx + dy * dy

	set: (x, y) ->
		@x = x
		@y = y
		this

	setX: (x) ->
		@x = x
		this

	setY: (y) ->
		@y = y
		this

	setLength: (l) ->
		oldLength = @length()
		if oldLength != 0 and l != oldLength
			@multiplyScalar l / oldLength
		this

	invert: (v) ->
		@x *= -1
		@y *= -1
		this

	lerp: (v, alpha) ->
		@x += (v.x - (@x)) * alpha
		@y += (v.y - (@y)) * alpha
		this

	rad: ->
		Math.atan2 @x, @y

	deg: ->
		@rad() * 180 / Math.PI

	equals: (v) ->
		@x == v.x and @y == v.y

	rotate: (theta) ->
		xtemp = @x
		@x = @x * Math.cos(theta) - (@y * Math.sin(theta))
		@y = xtemp * Math.sin(theta) + @y * Math.cos(theta)
		this

module.exports = Vector