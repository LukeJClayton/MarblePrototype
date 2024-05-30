extends PathFollow2D

@export var speed = 300
@export var item_width = 128
var index = 0
var offset
var movement = 0

func _ready():
	index = get_index()
	print(index)
	offset = item_width * index

func _physics_process(delta) -> void:
	movement = movement + (speed * delta)
	var desired_progress = (speed * delta) - (offset)

	if movement - offset < 0:
		progress = 0
		hide()
	else:
		show()
		desired_progress = (speed * delta)
		progress = movement - offset
		
	if progress_ratio >= 1:
		hide()
