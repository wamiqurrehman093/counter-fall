extends ColorRect

var currently_open: String = "Main"

func _ready():
	for window in get_children():
		window.hide()
		if window.has_node("Header/Back"):
			window.get_node("Header/Back").pressed.connect(_on_Back_pressed)
		var window_button = find_child(window.get_name() + "Button")
		if window_button:
			window_button.pressed.connect(_on_WindowButton_pressed.bind(window.get_name()))
	find_child(currently_open).show()

func _on_WindowButton_pressed(window_name):
	find_child(currently_open).hide()
	find_child(window_name).show()
	currently_open = window_name
	find_child(window_name + "Button")._on_mouse_exited()

func _on_Back_pressed():
	find_child(currently_open).hide()
	currently_open = "Main"
	find_child(currently_open).show()
