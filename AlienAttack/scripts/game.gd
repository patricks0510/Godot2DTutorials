extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD

func _ready():
	hud.set_score_label(score)

func _on_deathzone_area_entered(area):
	area.die()

func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
	if lives == 0:
		print("Game over!")
		player.die()
	else:
		print(lives)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
