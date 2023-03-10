extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("typing")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fat_smack_signal():
	get_node("AnimationPlayer").play("typing")
