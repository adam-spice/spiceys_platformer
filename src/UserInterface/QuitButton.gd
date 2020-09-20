extends Button


func _on_button_up() -> void:
	$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished() -> void:
	get_tree().quit()
