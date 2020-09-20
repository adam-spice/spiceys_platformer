extends Node2D

onready var enemy_scene = preload("res://src/Actors/Enemy.tscn")

export var enemy_count = 10

var screen_size 

func _ready() -> void:
	screen_size = get_viewport().size
	for i in range(enemy_count):
		spawn_enemy(int(screen_size.x), 0)
		
func _process(delta: float) -> void:
	var num_of_enemies = get_tree().get_nodes_in_group("ENEMIES").size()
	if num_of_enemies < enemy_count:
		spawn_enemy(int(screen_size.x), 0)


func spawn_enemy(range_x, range_y) -> void:
	var enemy = enemy_scene.instance()
	enemy.add_to_group("ENEMIES")
	enemy.random_start_direction = true
	enemy.position = Vector2(randi() % range_x, range_y)
	self.add_child(enemy)
