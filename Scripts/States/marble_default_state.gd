class_name MarbleDefaultState
extends StateMachine

@export var train_state: MarbleTrainState
@export var chambered_state: MarbleChamberedState

func _ready():
	super._ready()
	
func process_entity() -> void:
	if entity.train_spawned:
		parent_state.change_state(train_state)
	elif entity.chambered:
		parent_state.change_state(chambered_state)

