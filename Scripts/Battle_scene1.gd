extends Control

onready var battle_arrow = $Battle_Arrow
onready var arrow_pos = {"Vats_pos" : $VATS/Vats_pos, "Skills_pos" : $Skills/Skills_pos, 
"Items_pos" : $Items/Items_pos, "Run_pos" : $Run/Run_pos}

func _ready():
	self.visible = false
# warning-ignore:return_value_discarded
	Global.connect("battle_started" , self , "init")

func init():
	self.visible = true
	get_tree().paused = true
	$VATS.grab_focus()
	
func _on_Run_pressed():
	self.visible = false
	get_tree().paused = false
	Global.emit_signal("battle_ended")


func _on_VATS_focus_entered():
	battle_arrow.global_position = arrow_pos.Vats_pos.global_position

func _on_Skills_focus_entered():
	battle_arrow.global_position = arrow_pos.Skills_pos.global_position
	
func _on_Items_focus_entered():
	battle_arrow.global_position = arrow_pos.Items_pos.global_position

func _on_Run_focus_entered():
	battle_arrow.global_position = arrow_pos.Run_pos.global_position
