extends Node3D

const ROTATION_SPEED = 0.005

@onready var spring_arm: SpringArm3D = $SpringArm3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * ROTATION_SPEED)
		spring_arm.rotate_x(-event.relative.y * ROTATION_SPEED)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, -PI/4, PI/4)
