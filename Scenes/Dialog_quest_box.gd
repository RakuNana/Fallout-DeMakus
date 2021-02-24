extends Popup

enum QUEST_STATUS {NOT_STARTED, STARTED, COMPLETED , DENIED}
var quest_state = QUEST_STATUS.NOT_STARTED


export var quest_unresolved = ["Can you find my item"]
export var quest_accepted = ["Great! Thanks." , "Did you find it?"]
export var quest_refused = ["Really? Well that's a shame." , "I guess I'll have to find some else to find it then"]

var dialog_index = 0

var quest_item_found = false
var can_speak = false


func _ready():
	$Answer.visible = false
	
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") && can_speak == true:
		quest_dialog()
	
	
func quest_dialog():
	self.popup()
	$Text_arrow.play("arrow_blink")
	get_tree().paused = true
	
	match quest_state:
		QUEST_STATUS.NOT_STARTED:
			$Spoken_Dialog.bbcode_text = quest_unresolved[dialog_index]
			$Answer/Yes.grab_focus()
			$Answer.visible = true
			can_speak = false
			
			
		QUEST_STATUS.STARTED:
			$Spoken_Dialog.bbcode_text = quest_accepted[dialog_index +1]
			$Answer.visible = false
			can_speak = false
			
		QUEST_STATUS.DENIED:
			$Spoken_Dialog.bbcode_text = quest_refused[dialog_index]
			$Answer.visible = false
			can_speak = false
	

func _on_Interact_box_area_entered(_area):
	can_speak = true
	print(can_speak)

func _on_Interact_box_area_exited(_area):
	can_speak = false
	print(can_speak)

func _on_Yes_pressed():
	if quest_state != QUEST_STATUS.DENIED:
		quest_state = QUEST_STATUS.STARTED
		#$Spoken_Dialog.bbcode_text = quest_accepted[dialog_index]
		#$Answer.visible = false
		#get_tree().paused = false
		#self.hide()

func _on_No_pressed():
	if quest_state != QUEST_STATUS.STARTED:
		quest_state = QUEST_STATUS.DENIED
		$Spoken_Dialog.bbcode_text = quest_refused[dialog_index]
		dialog_index += 1
		$Answer.visible = false
		get_tree().paused = false
		self.hide()
		
	
