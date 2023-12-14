extends Node2D

@onready var controle = $HUD/controle

@onready var player := $player as CharacterBody2D
@onready var camera := $camera as Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	player.follow_camera(camera)
	player.player_has_died.connect(game_over)
	controle.time_is_up.connect(game_over)
	reset_player_values()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://prefabs/GameOver.tscn")

func reset_player_values():
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3
