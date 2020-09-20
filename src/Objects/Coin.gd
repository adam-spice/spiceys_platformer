extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 1


func _on_body_entered(body: PhysicsBody2D) -> void:
	picked()


func picked() -> void:
	$AudioStreamPlayer.play()
	PlayerData.score += score
	anim_player.play("picked")
