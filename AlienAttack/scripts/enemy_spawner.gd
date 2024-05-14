extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var spawn_pos_array = spawn_positions.get_children()
	var random_spawn_pos = spawn_pos_array.pick_random()
	
	var enemy_insntance = enemy_scene.instantiate()
	enemy_insntance.global_position = random_spawn_pos.global_position
	emit_signal("enemy_spawned", enemy_insntance)
	


func _on_timer_path_timeout():
	spawn_path_enemy()
	
func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned",path_enemy_instance)
