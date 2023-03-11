extends CharacterBody2D

const SPEED = 300.0
var health = 3
@onready var animationPlayer = $PlayerAP
@onready var timer = $Timer

func _physics_process(delta):
	# Add the gravity.
	velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED/2)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if (Input.is_action_just_pressed("ui_up") and timer.is_stopped()):
		print("BOOST!")
		velocity.x += 1000
		timer.set_wait_time(5)
		timer.start()
		
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
		get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_timer_timeout():
	timer.stop()
