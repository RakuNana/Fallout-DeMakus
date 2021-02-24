extends Node2D


func _ready():
	if Global.player_pos:
		get_node("Player").global_position = Global.player_pos

