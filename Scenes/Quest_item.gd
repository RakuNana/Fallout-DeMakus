extends Area2D

export var item_get = "Item"

func _ready():
	if Global.quest_item_found == true:
		queue_free()

func _on_Area2D_area_entered(_area):
	get_tree().paused = true
	$CanvasLayer/Info_box/Text_arrow.play("arrow_blink")
	$CanvasLayer/Info_box.popup()
	$CanvasLayer/Info_box/RichTextLabel.bbcode_text = item_get
	Global.quest_item_found = true
	$CanvasLayer/End_convo.grab_focus()
	print(Global.quest_item_found)

func _on_End_convo_pressed():
	self.queue_free()
	get_tree().paused = false
