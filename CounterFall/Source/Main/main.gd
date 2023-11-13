extends Node3D

func _ready():
	for option in find_child("Options").get_children():
		option.pressed.connect(Callable(self, option.get_name().to_lower() + "_selected"))

func play_selected():
	get_tree().change_scene_to_file("res://Tests/Levels/Level10/level_11.tscn")

func loadout_selected():
	print("loadout")

func inventory_selected():
	print("inventory")

func stats_selected():
	print("stats")

func settings_selected():
	print("settings")

func quit_selected():
	get_tree().quit()
