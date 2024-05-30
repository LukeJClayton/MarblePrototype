class_name Marble
extends CharacterBody2D

@export_category("Mechanisms")
@export var marble: Marble
@export var state_machine: StateMachine
@export var collider: Area2D
@export var detector: Area2D

@export_category("Configuration")
@export var train_spawned: bool
@export var enable_detection: bool
@export var chambered: bool
@export var travelling: bool
@export var speed: float = 300

var detected_marbles: Array[CharacterBody2D]

signal fire_marble()

func _ready() -> void:
	state_machine.enter_state_machine()
	connect_detectors()

func _physics_process(_delta: float) -> void:
	state_machine.process_state_machine()
	
	if marble.travelling:
		position += transform.x * speed * _delta

func _on_marble_detector_body_entered(body):
	if body != marble and enable_detection:
		detected_marbles.append(body)

func _on_marble_detector_body_exited(body):
	detected_marbles.erase(body)

func _on_marble_collider_body_entered(body):
	if enable_detection:
		if detected_marbles.size() == 1:
			print(detected_marbles)
			print('one marble colided')
		elif detected_marbles.size() > 1:
			print(body)
			print(detected_marbles)

func connect_detectors() -> void:
	collider.body_entered.connect(_on_marble_collider_body_entered)
	detector.body_entered.connect(_on_marble_detector_body_entered)
	detector.body_exited.connect(_on_marble_detector_body_exited)

func travel() -> void:
	emit_signal('fire_marble')
	marble.travelling = true;
	
	
