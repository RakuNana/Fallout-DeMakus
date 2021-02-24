extends Area2D

export (String , FILE , "*tscn") var world_exit
export (Vector2) var spawner_pos

func _process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" && Input.is_action_just_pressed("ui_accept"):
# warning-ignore:return_value_discarded
			get_tree().change_scene(world_exit)
			Global.player_pos = spawner_pos

func _on_Door_area2D_area_entered(_area):
	if world_exit:
		get_node("/root/Global").player_pos = spawner_pos
	
	
