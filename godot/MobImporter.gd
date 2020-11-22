tool extends Node2D

export(String) var csv = "res://maps/AlienShip-Machinery.csv"
export(bool) var go = false setget _go

func _go(checked:bool):
	if checked:
		self.run()	
		self.set("go", false)



func clear_nodes():
	for node in get_children():
		remove_child(node)
		node.queue_free()


func add_mob(x,y,name):
	var node : Node2D = $"../../Sprites".find_node(name)
	if node == null:
		print("couldn't find node: " + name)
	else:
		node = node.duplicate()
		self.add_child(node)
		node.set_owner(get_tree().edited_scene_root)
		node.position.x = x
		node.position.y = y

	


func run():
	self.clear_nodes()
	var f = File.new()
	f.open(self.csv, File.READ)
	print("loading")
	for line in f.get_as_text().split("\n"):
		if line != "":
			var row = line.split(",")
			self.add_mob(int(row[0]), int(row[1]), row[2])
			

			
