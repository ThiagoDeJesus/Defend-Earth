extends Control

onready var scenetree: = get_tree()
var pause: bool = false
var player_dead: = false
var win: bool = false
onready var resume_button: = $ColorRect/VBoxContainer/Resume
onready var label_text: = $ColorRect/Label

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause_game()
	if player_dead:
		resume_button.visible = false
		label_text.text = "You died"
	if win:
		resume_button.visible = false
		label_text.text = "Congratulations"
	
func pause_game() -> void:
	var pause_scene_view: = self
	pause = not pause
	scenetree.paused = pause
	pause_scene_view.visible = not pause_scene_view.visible


func _on_Resume_button_up() -> void:
	pause_game()


func _on_Retry_button_up() -> void:
	scenetree.reload_current_scene()
	pause_game()


func _on_Quit_button_up() -> void:
	scenetree.quit()


func _on_MainMenu_button_up() -> void:
	scenetree.change_scene("res://Scenes/MainScene.tscn")
	pause_game()
