extends Popup
class_name dialog_script

export var dialog = ["message1" , "message2"]
export var NPC_Name = "NPC"
var dialog_index = 0

var can_speak = false
var finished = false

func _ready():
	$Text_arrow.visible = false
	self.hide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and can_speak == true:
		load_dialog()

func load_dialog():
	self.popup()
	$Text_arrow.visible = true
	$Text_arrow.play("arrow_blink")
	get_tree().paused = true
	$NPC_Name.bbcode_text = NPC_Name
	if dialog_index < dialog.size():
		$Spoken_Dialog.bbcode_text = dialog[dialog_index]
	else:
		self.hide()
		$Text_arrow.hide()
		get_tree().paused = false
		dialog_index = 0
	dialog_index += 1
	
func _on_Interact_box_area_entered(_area):
	can_speak = true
	
func _on_Interact_box_area_exited(_area):
	can_speak = false
	dialog_index = 0
	self.hide()
	
