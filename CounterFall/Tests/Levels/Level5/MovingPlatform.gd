extends AnimatableBody3D

@export_group("Movement")
@export var movement_velocity: Vector3 = Vector3(0, 0, 3)
@export var move_distance: float = 10.0

var start_location: Vector3

@export_group("Rotation")
@export var rotation_velocity: Vector3 = Vector3(0, 0, 0)

func _ready():
	start_location = position

func _physics_process(delta):
	move_platform(delta)
	rotate_platform(delta)

func move_platform(delta):
	if should_platform_return():
		var move_direction := movement_velocity.normalized()
		start_location += move_direction * move_distance
		position = start_location
		movement_velocity *= -1
	else:
		var current_location := position
		current_location += movement_velocity * delta
		position = current_location

func rotate_platform(delta):
	if rotation_velocity != Vector3.ZERO:
		rotation_degrees += rotation_velocity * delta

func should_platform_return():
	return get_distance_moved() > move_distance

func get_distance_moved():
	return start_location.distance_to(position)
