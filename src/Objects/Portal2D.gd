tool
extends Area2D

onready var user_interface = get_tree().get_root().find_node("UserInterface", true, false)
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var portal_unlocked: = false
export var next_scene: PackedScene

func _ready() -> void:
	user_interface.connect("unlock_portal", self, "_on_unlock_portal")


func _on_body_entered(body: PhysicsBody2D):
	if portal_unlocked:
		$AudioStreamPlayer.play()
		teleport()
	
	
func _on_AudioStreamPlayer_finished() -> void:
	pass

func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""

func _on_unlock_portal() -> void:
	portal_unlocked = true

func teleport() -> void:
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
