extends Node2D

var smack_counter = 0
signal smack_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("typing")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "typing"):
		get_node("AnimationPlayer").play("smack")
	elif (anim_name == "smack"):
		print("TESTE")
		if (smack_counter == 3):
			get_node("AnimationPlayer").play("typing")
			emit_signal("smack_signal")
			smack_counter = 0
			return
		smack_counter += 1
		print(smack_counter)
		

