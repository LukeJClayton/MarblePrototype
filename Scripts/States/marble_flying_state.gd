class_name MarbleFlyingState
extends StateMachine

@export var train_state: MarbleTrainState

func _ready():
	super._ready()
	
func process_entity() -> void:
	if entity.train_spawned:
		parent_state.change_state(train_state)
	else:
		entity.enable_detection = true
