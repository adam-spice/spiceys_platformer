extends Node


onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $Score
onready var time_label: Label = $Time
onready var score_total_label: Label = $ScoreTotal
onready var pause_overlay: ColorRect = $PauseOverlay
onready var title_label: Label = $PauseOverlay/Title
onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton


const MESSAGE_DIED: = "You died"

var paused: = false setget set_paused
signal portal_unlocked


func _ready() -> void:
	PlayerData.connect("updated", self, "update_interface_score")
	PlayerData.connect("died", self, "_on_Player_died")
	update_interface_score()


func _on_Player_died() -> void:
	self.paused = true
	title_label.text = MESSAGE_DIED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title_label.text != MESSAGE_DIED:
		self.paused = not self.paused


func update_interface_score() -> void:
	score_label.text = "Score: %s" % PlayerData.score
	if str(PlayerData.score) == time_label.text:
		emit_signal("unlock")
	
func update_interface_time(time: String) -> void:
	time_label.text = "Time Left: %s" % str(time)
	
func update_interface_score_total(total: int) -> void:
	score_total_label.text = "/ %s" % str(total)

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
