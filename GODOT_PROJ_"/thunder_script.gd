extends Area2D

@onready var animationPlayer = $AnimationPlayer
@onready var timer = $Timer
@onready var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	timer.set_wait_time(rng.randf_range(1, 6))
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	animationPlayer.play("thunderclap")
	timer.set_wait_time(rng.randf_range(1.5, 6))
	timer.start()

func _on_animation_player_animation_finished(anim_name):
	animationPlayer.seek(0, true)
