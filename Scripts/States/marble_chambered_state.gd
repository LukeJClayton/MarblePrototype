class_name MarbleChamberedState
extends StateMachine

@export var flying_state: MarbleFlyingState

func _ready():
	super._ready()
	
func process_entity() -> void:
	print('entity')
	if Input.is_action_just_pressed("fire"):
		print('here')
		parent_state.change_state(flying_state)

