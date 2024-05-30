class_name Shooter
extends Node2D

@export var chambered_marble: Marble
@export var chamber: Node2D
@export var magazine: Node

var speed = 300

const MARBLE_SCENES: Dictionary = {
	'basic': preload("res://Scenes/Marbles/marble_basic.tscn"),
}

var magazine_array: Array[Marble]

func _ready():
	#var first_marble = MARBLE_SCENES.basic.instantiate()
	#chamber.add_child(first_marble)
	pass
	
func chamber_marble(marble: Marble) -> void:
	chambered_marble = marble
	marble.chambered = true
	marble.fire_marble.connect(fire_marble)
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	if chambered_marble:
		chambered_marble.rotation = rotation
		chambered_marble.position = position

func fire_marble() -> void:
	chambered_marble = null
