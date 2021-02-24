extends Popup
class_name branching_dialog

#ctrl + k to un/comment
enum QUEST_STATUS {UNRESOLVED , ACCEPTED , REFUSED , COMPLETED}

export var responses = {"unresolved" : "can you find my item" ,
"accepted" : " Great! Tell me when you have it" , 
"refused" : "Well that's a damn shame." , "completed" : "Thanks for finding my missing item!!"}
export var quest_declined_dialog = "Guess I'll have to ask someone else....."

var dialog_index = 0

var quest_status = QUEST_STATUS.UNRESOLVED
#export var quest_item_obtained = false
var refused_quest = false

var can_talk = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") && can_talk == true:
		quest_dialog()
		
func quest_dialog():
	can_talk = false
	self.popup()
	$Text_arrow.play("arrow_blink")
	get_tree().paused = true
	
	
	if Global.quest_item_found == false or true && quest_status == QUEST_STATUS.UNRESOLVED:
		$Spoken_Dialog.bbcode_text = responses.unresolved
		$Answer.visible = true
		$Answer/Yes.grab_focus()

	if quest_status == QUEST_STATUS.ACCEPTED:
		$Spoken_Dialog.bbcode_text = responses.accepted
		$Answer.visible = false
		$End_convo.grab_focus()

	if quest_status == QUEST_STATUS.REFUSED && refused_quest == true:
		$Spoken_Dialog.bbcode_text = responses.refused 
		if refused_quest == true:
			$Spoken_Dialog.bbcode_text = quest_declined_dialog
		$Answer.visible = false
		$End_convo.grab_focus()
		

	if Global.quest_item_found == true or Global.quest_completed == true:
		quest_status = QUEST_STATUS.COMPLETED
		$Spoken_Dialog.bbcode_text = responses.completed
		Global.quest_completed = true
		$Answer.visible = false
		$End_convo.grab_focus()
			
		if Global.quest_completed == true && Global.reward_recieved == false:
			$Spoken_Dialog.bbcode_text = "Recieved a reward!!"
			Global.reward = 1
			Global.reward_recieved = true
			yield(get_tree().create_timer(2), "timeout")
			print(Global.reward)
			print(Global.reward_recieved)
					


func _on_Interact_box_area_entered(_area):
	can_talk = true
	print(can_talk)

func _on_Interact_box_area_exited(_area):
	can_talk = false
	print(can_talk)

func _on_Yes_pressed():
	$Answer.visible = false
	quest_status = QUEST_STATUS.ACCEPTED
	$Spoken_Dialog.bbcode_text = responses.accepted
	$End_convo.grab_focus()

func _on_No_pressed():
	$Answer.visible = false
	quest_status = QUEST_STATUS.REFUSED
	$Spoken_Dialog.bbcode_text = responses.refused
	$End_convo.grab_focus()
	refused_quest = true
	

func _on_End_convo_pressed():
	self.hide()
	get_tree().paused = false
	
