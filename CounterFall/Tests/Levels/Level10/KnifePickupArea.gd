extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body: Node3D):
	if body.is_in_group("player"):
		print("You picked up the knife!")
		queue_free()
