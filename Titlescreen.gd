extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalAuto.score = 0
	GlobalAuto.time = 5
	GlobalAuto.moveSpeed = 100
	$Label/HS.set_text(str(GlobalAuto.highScore))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://BaseScene.tscn")
