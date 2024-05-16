extends Control

@export var firstLevel: PackedScene = null

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(firstLevel)


func _on_quit_button_pressed():
	get_tree().quit()
