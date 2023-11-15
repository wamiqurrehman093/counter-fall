extends TextureButton

@export var label: String = ""
@export var font_size: int = 24
@export var normal_colour: Color = Color(0.25, 0.25, 0.25, 1.0)
@export var hover_colour: Color = Color(1.0, 1.0, 1.0, 1.0)

func _ready():
	$Label.set("theme_override_font_sizes/font_size", font_size)
	$Label.text = label
	$Label.hide()
	self_modulate = normal_colour
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	$Label.pivot_offset = $Label.size / 2

func _on_mouse_entered():
	self_modulate = hover_colour
	$Label.show()

func _on_mouse_exited():
	self_modulate = normal_colour
	$Label.hide()
