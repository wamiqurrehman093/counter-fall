extends ColorRect

var currently_open: String = "Main"

func _ready():
	find_child("MeleeButton").pressed.connect(_on_MeleeButton_pressed)
	for window in get_children():
		window.hide()
		if window.has_node("Header/Back"):
			window.get_node("Header/Back").pressed.connect(_on_Back_pressed)
	find_child(currently_open).show()

func _on_MeleeButton_pressed():
	find_child(currently_open).hide()
	find_child("Melee").show()
	currently_open = "Melee"

func _on_Back_pressed():
	find_child(currently_open).hide()
	currently_open = "Main"
	find_child(currently_open).show()
