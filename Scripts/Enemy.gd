extends StaticBody2D

export var dialog = ["INTRUDER!" , "YOU WILL BE TERMINATED!!"]
var dialog_index = 0

var can_speak = false

func _ready():
	$CanvasLayer/Dialog_box.hide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") && can_speak == true:
		load_dialog()
		
func load_dialog():
	$CanvasLayer/Dialog_box.popup()
	$CanvasLayer/Dialog_box/Text_arrow.play("arrow_blink")
	if dialog_index < dialog.size():
		$CanvasLayer/Dialog_box/RichTextLabel.bbcode_text = dialog[dialog_index]
		get_tree().paused = true
	else:
		$CanvasLayer/Dialog_box.hide()
		get_tree().paused = false
		dialog_index = 0
		Global.emit_signal("battle_started")
		can_speak = false
	dialog_index += 1
	

func _on_Interact_box_area_entered(_area):
	can_speak = true
	
func _on_Interact_box_area_exited(_area):
	can_speak = false
	dialog_index = 0
	$CanvasLayer/Dialog_box.hide()
	$CanvasLayer/Dialog_box/Text_arrow.hide()
	
