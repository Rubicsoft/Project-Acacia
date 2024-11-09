extends Camera3D

@export var player: CharacterBody3D

var is_follow_player: bool = true

const CAMERA_SMOOTHNESS = 12.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event) -> void:
	if event.is_action_pressed("toggle_camera_follow"):
		match is_follow_player:
			true:
				is_follow_player = false
			false:
				is_follow_player = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if is_follow_player:
		global_position.x = lerp(global_position.x, player.global_position.x, CAMERA_SMOOTHNESS * delta)
