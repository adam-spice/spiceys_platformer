extends Node2D

export var total_level_time: = 45
export var score_required: = 20

var s: = total_level_time - 1
var ms: = 9

onready var timer: =  $Timer
onready var user_interface: = $InterfaceLayer/UserInterface
onready var player: = $Player
onready var portal_unlocked: = false

signal unlock_portal

func _ready() -> void:

	timer.start()
	user_interface.update_interface_score_total(score_required)

func _process(delta: float) -> void:

	if ms < 1:
		s -= 1
		ms = 9
	
	if s == 0:
		player.die()
			
	user_interface.update_interface_time(str(s) + ":" + str(ms))
	if PlayerData.score >= score_required:
		emit_signal("unlock_portal")

func _on_Timer_timeout() -> void:
	ms -= 1
