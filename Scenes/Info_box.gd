extends Popup

export var item_pickup = ["item description"]

var item_pickup_index = 0

func _on_Quest_Item_area_entered(_area):
	self.popup()
	$RichTextLabel.bbcode_text = item_pickup


func _on_End_convo_pressed():
	
	pass # Replace with function body.
