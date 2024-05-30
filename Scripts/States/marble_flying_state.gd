class_name MarbleFlyingState
extends StateMachine

@export var train_state: MarbleTrainState

var speed = 300

func _ready():
	super._ready()
	
func process_entity() -> void:
	print('flying')
	entity.enable_detection = true
	entity.travel()
