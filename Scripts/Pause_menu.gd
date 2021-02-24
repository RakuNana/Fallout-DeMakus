extends Node2D

onready var nav_buttons = $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons
onready var items_nav = $CanvasLayer/Control/Anchor/Items_Nav
onready var menu_arrow = $CanvasLayer/Control/Anchor/Menu_Arrow
onready var arrow_locations = {"item_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Items/item_pos, 
"stats_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Stats/stats_pos, 
"save_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Save/save_pos,
"skills_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Skills/skills_pos, 
"options_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Options/options_pos, 
"exit_button" : $CanvasLayer/Control/Anchor/Pip_boy_Menu/Nav_buttons/Exit/exit_pos,
"items_back_button" : $CanvasLayer/Control/Anchor/Items_Nav/Back/back_pos,
"items_exit_button" : $CanvasLayer/Control/Anchor/Items_Nav/Items_Exit/items_exit_pos}

func _ready():
	item_nav()
	menu_buttons()
	
func menu_buttons():
	nav_buttons.visible = true
	get_tree().paused = true
	nav_buttons.get_node("Items").grab_focus()
	
func item_nav():
	items_nav.visible = false

func _on_Exit_pressed():
	self.queue_free()
	get_tree().paused = false

func _on_Items_pressed():
	nav_buttons.visible = false
	items_nav.visible = true
	items_nav.get_node("Back").grab_focus()
	
func _on_Items_Exit_pressed():
	self.queue_free()
	get_tree().paused = false

func _on_Back_pressed():
	items_nav.visible = false
	nav_buttons.visible = true
	nav_buttons.get_node("Items").grab_focus()
	
func _on_Items_focus_entered():
	menu_arrow.global_position = arrow_locations.item_button.global_position
	
func _on_Stats_focus_entered():
	menu_arrow.global_position = arrow_locations.stats_button.global_position
	
func _on_Save_focus_entered():
	menu_arrow.global_position = arrow_locations.save_button.global_position

func _on_Skills_focus_entered():
	menu_arrow.global_position = arrow_locations.skills_button.global_position

func _on_Options_focus_entered():
	menu_arrow.global_position = arrow_locations.options_button.global_position

func _on_Exit_focus_entered():
	menu_arrow.global_position = arrow_locations.exit_button.global_position

func _on_Back_focus_entered():
	menu_arrow.global_position = arrow_locations.items_back_button.global_position

func _on_Items_Exit_focus_entered():
	menu_arrow.global_position = arrow_locations.items_exit_button.global_position
