extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Mouse"):
		get_tree().change_scene("res://BaseScene.tscn")
		
		GlobalAuto.score += 1
		if GlobalAuto.moveSpeed > 50:
			GlobalAuto.time += .1
			GlobalAuto.moveSpeed -= 5
		elif GlobalAuto.moveSpeed > 25 and GlobalAuto.moveSpeed < 50:
			GlobalAuto.time += .25
			GlobalAuto.moveSpeed -= 1
		elif GlobalAuto.moveSpeed > 10 and GlobalAuto.moveSpeed < 25:
			GlobalAuto.time += .50
			GlobalAuto.moveSpeed -= .25
		elif GlobalAuto.moveSpeed == 10:
			GlobalAuto.time += 1
		
	
