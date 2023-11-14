extends TextureButton

@export var normal_colour: Color = Color(0.25, 0.25, 0.25, 1.0)
@export var hover_colour: Color = Color(1.0, 1.0, 1.0, 1.0)

func _ready():
	self_modulate = normal_colour
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	self_modulate = hover_colour

func _on_mouse_exited():
	self_modulate = normal_colour
