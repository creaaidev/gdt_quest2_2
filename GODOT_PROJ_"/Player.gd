extends CharacterBody2D

const SPEED = 300.0
var health = 3
@onready var animationPlayer = $PlayerAP

func _physics_process(delta):
	# Add the gravity.
	velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	animate(velocity)

	move_and_slide()

func animate(velocity):
	if (velocity.x > 0):
		animationPlayer.play("right_walk")
	elif (velocity.x < 0):
		animationPlayer.play("left_walk")
	else:
		animationPlayer.seek(0, true)
		animationPlayer.stop()


func _on_area_2d_body_entered(body):
	health -= 1
	if (health == 0):
		get_tree().change_scene_to_file(node_2d)
