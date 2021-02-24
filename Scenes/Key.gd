extends Sprite


func _ready():
	self.visible = false
	$Area2D/CollisionShape2D.disabled = true

func _on_Yes_pressed():
	if Global.quest_key == false:
		$Area2D/CollisionShape2D.disabled = false
		self.visible = true


func _on_Area2D_area_entered(_area):
	Global.quest_key = true
	print("works")
	queue_free()
