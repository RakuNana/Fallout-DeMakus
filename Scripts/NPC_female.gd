extends StaticBody2D

#export var npc_skin = 0
export(Texture) var skin

func _ready():
	$NPC_skin.play()
	pass
#	if npc_skin == 0:
#		$NPC_skin.play("female_idle")
#	elif npc_skin == 1:
#		$NPC_skin.play("male_idle")
#	elif npc_skin == 2:
#		$NPC_skin.play("Doc_Mitchell")
