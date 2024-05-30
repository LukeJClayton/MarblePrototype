class_name Level
extends Node2D

@export var shooter: Shooter
@export var chamber: Node
var chambered_marble: Marble

const MARBLE_SCENES: Dictionary = {
	'basic': preload("res://Scenes/Marbles/marble_basic.tscn"),
}

func _enter_tree() -> void:
	Globals.shooter = shooter

func _process(delta) -> void:
	if not chambered_marble:
		var first_marble = MARBLE_SCENES.basic.instantiate()
		chambered_marble = first_marble
		shooter.chamber_marble(first_marble)
		chamber.add_child(chambered_marble)
		
