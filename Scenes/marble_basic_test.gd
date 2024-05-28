extends CharacterBody2D

func _ready():
	pass

func _physics_process(delta):
	velocity.y += 2 * delta
	move_and_slide()
