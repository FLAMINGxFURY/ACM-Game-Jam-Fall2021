extends Node2D


# Declare member variables here. Examples:
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Time.start(GlobalAuto.time)
	# init rng
	rng.randomize()
	
	# scene setting
	self.scale = Vector2(1,1)
	
	# create map
	create_map()

func create_map():
	rng.randomize()
	
	var CellSize = Vector2(10,10)
	var height = 480/CellSize.x
	var width = 270/CellSize.y
	# Assuming scale = 2.5 x 2.5:
	# End X index = 68 
	# End Y index = 38
	
#	# Very bad cell generator
#	for x in range(68):
#		for y in range(38):
#			if(rng.randi() % 5 == 0):
#				$TileMap.set_cell(x,y,1)
	
	# Path Generator
	var x = rng.randi_range(0, 47)
	var y = rng.randi_range(0, 26)
	
	var steps = rng.randi_range(50, 100)

	# first, make the starting box.
	startingCell(x,y)
	for i in range(steps):
		# first, decide direction
		var dir = rng.randi_range(1,4)
		
	# North
		if dir == 1 and y > 2:
			y -= 2
		
		# South
		if dir == 2 and y < 24:
			y += 2
		
		# East
		if dir == 3 and x > 2:
			x -= 2

		if dir == 4 and x < 45:
			x += 2
		
		$TileMap.set_cell(x, y, 0)
		$TileMap.set_cell(x+1, y, 0)
		$TileMap.set_cell(x, y+1, 0)
		$TileMap.set_cell(x+1, y+1, 0)
	$CheeseEnd.position = $TileMap.map_to_world(Vector2(x+1, y+1))
	
	# Makes autotile work
	$TileMap.update_bitmask_region()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Timer.set_text(str(stepify($Time.time_left, 0.01)))
	#$Score.set_text(str(GlobalAuto.score))
	$Score.set_text(str(GlobalAuto.moveSpeed))
	
func startingCell(x,y):
	$TileMap.set_cell(x, y, 0)
	$TileMap.set_cell(x+1, y, 0)
	$TileMap.set_cell(x, y+1, 0)
	$TileMap.set_cell(x+1, y+1, 0)
	$Mouse.position = $TileMap.map_to_world(Vector2(x+1, y+1))
	get_viewport().warp_mouse($Mouse.position)


func _on_Time_timeout():
	if GlobalAuto.score >= GlobalAuto.highScore:
		GlobalAuto.highScore = GlobalAuto.score
	get_tree().change_scene("res://Titlescreen.tscn")
