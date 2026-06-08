extends Control

@onready var main_menu_buttons: VBoxContainer = $mainMenuButtons


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
