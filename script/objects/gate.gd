extends Node3D

@onready var gate_animation = $PieceBlocking/AnimationPlayer

var is_gate_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("toggle_gate_open"):
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gate_animation.play("open_door")
