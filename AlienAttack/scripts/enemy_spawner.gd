extends Node2D

signal enemy_spawned(enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")

#@onready var enemy_container = $EnemyContainer
@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var spawn_pos_array = spawn_positions.get_children()
	var random_spawn_pos = spawn_pos_array.pick_random()
	
	var enemy_insntance = enemy_scene.instantiate()
	enemy_insntance.global_position = random_spawn_pos.global_position
	emit_signal("enemy_spawned", enemy_insntance)
	#add_child(enemy_insntance)
	
	
	
