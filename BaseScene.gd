extends Node2D


# Declare member variables here. Examples:
var rng = RandomNumberGenerator.new()
var tdict = OS.get_time()


# Called when the node enters the scene tree for the first time.
func _ready():
	# init rng
	rng.seed = tdict.hour * tdict.minute * tdict.second
	
	# scene setting
	self.scale = Vector2(2.4,2.4)
	
	# create map
	create_map()
	pass # Replace with function body.

func create_map():
	# Assuming scale = 2.5 x 2.5:
	# End X index = 68 
	# End Y index = 38
	
#	# Very bad cell generator
#	for x in range(68):
#		for y in range(38):
#			if(rng.randi() % 5 == 0):
#				$TileMap.set_cell(x,y,1)
	
	# Path Generator
	var x = rng.randi_range(2, 67)
	var y = rng.randi_range(2, 37)
	
	var steps = rng.randi_range(50, 200)
	
	# first, make the starting box. TODO: add player spawn here
	$TileMap.set_cell(x, y, 1)
	$TileMap.set_cell(x+1, y, 1)
	$TileMap.set_cell(x, y+1, 1)
	$TileMap.set_cell(x+1, y+1, 1)
	
	for i in range(steps):
		# first, decide direction
		var dir = rng.randi_range(1,4)
		
		# North
		if dir == 1 and y > 2:
			y -= 2
		
		# South
		if dir == 2 and y < 35:
			y += 2
			
		# East
		if dir == 3 and x > 2:
			x -= 2
		
		if dir == 4 and x < 65:
			x += 2
		
		$TileMap.set_cell(x, y, 1)
		$TileMap.set_cell(x+1, y, 1)
		$TileMap.set_cell(x, y+1, 1)
		$TileMap.set_cell(x+1, y+1, 1)
	
	$TileMap.update_bitmask_region()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
