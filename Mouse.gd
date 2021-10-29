extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const stop_distance = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_move_to_mouse()
	#_look_at_mouse()

func _move_to_mouse():
	if position.distance_to(get_global_mouse_position()) > stop_distance:
		var vec = get_global_mouse_position() - position
		var normalized_vec = vec.normalized()
		move_and_slide(normalized_vec * GlobalAuto.moveSpeed)

func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90
