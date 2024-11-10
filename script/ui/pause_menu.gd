extends Control

var is_game_paused: bool = true

func _input(event):
	if event.is_action_pressed("esc") and !get_tree().paused:
		pause_game()

func _process(delta):
	visible = get_tree().paused

func pause_game() -> void:
	get_tree().paused = true
func resume_game() -> void:
	get_tree().paused = false

func _on_continue_btn_pressed():
	resume_game()

func _on_quit_btn_pressed():
	get_tree().quit()
