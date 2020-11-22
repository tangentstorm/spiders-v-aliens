extends Sprite

export(bool) var dead = false setget set_dead

func set_dead(val):
	self.frame = int(val)
