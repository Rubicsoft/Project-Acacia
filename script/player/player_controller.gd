extends CharacterBody3D

@export var camera: Camera3D
@export var empty: Node3D
@onready var sprite = $Sprite3D

const SPEED = 2.5
const JUMP_VELOCITY = 4.5
const MOVEMENT_SMOOTHNESS = 10.0
const CAMERA_SMOOTHNESS = 12.5

var camera_follow: bool = true

func _input(event) -> void:
	# Toggle camera follow
	if event.is_action_pressed("toggle_camera_follow"):
		match camera_follow:
			true:
				camera_follow = false
			false:
				camera_follow = true

func _process(delta) -> void:
	pass
	## Camera follows the player
	#if camera_follow:
		#camera.global_position.x = lerp(camera.global_position.x, global_position.x, CAMERA_SMOOTHNESS * delta)
		#camera.global_position.z = lerp(camera.global_position.z, global_position.z, CAMERA_SMOOTHNESS * delta)
	#else:
		#camera.global_position.x = lerp(camera.global_position.x, empty.global_position.x, CAMERA_SMOOTHNESS * delta)
		#camera.global_position.z = lerp(camera.global_position.z, empty.global_position.z, CAMERA_SMOOTHNESS * delta)

func _physics_process(delta) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x, direction.x * SPEED * 100.0 * delta, MOVEMENT_SMOOTHNESS * delta)
		velocity.z = lerp(velocity.z, direction.z * SPEED * 100.0 * delta, MOVEMENT_SMOOTHNESS * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	sprite_orientation(input_dir.x)

func sprite_orientation(direction: float) -> void:
	if direction != 0:
		if direction >= 0:
			sprite.flip_h = false
		elif direction <= 0:
			sprite.flip_h = true

func _on_nearby_raycast_body_entered(body):
	print(body.name)
