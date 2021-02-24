extends KinematicBody2D

const MENU = preload ("res://Scenes/Pause_menu.tscn")

var speed = 75
var direction = Vector2()

func _ready():
	set_name("Player")
	
func pause_menu():
	if Input.is_action_just_pressed("Menu"):
		var menu = MENU.instance()
		get_parent().add_child(menu)
		
		
func sprite_control():
	if Input.is_action_pressed("up"):
		$Wander_sprite.play("walk_up")
	elif Input.is_action_pressed("down"):
		$Wander_sprite.play("walk_down")
	elif Input.is_action_pressed("left"):
		$Wander_sprite.play("walk_left")
	elif Input.is_action_pressed("right"):
		$Wander_sprite.play("walk_right")
	else:
		$Wander_sprite.stop()
	pass
	
func control_loop():
	if direction == Vector2(0,0):
		$Wander_sprite.stop()
		
	var Left = Input.is_action_pressed("left")
	var Right = Input.is_action_pressed("right")
	var Up = Input.is_action_pressed("up")
	var Down = Input.is_action_pressed("down")
	
	direction.x = -int(Left) + int(Right)
	direction.y = -int(Up) + int(Down)
	
	direction = direction.normalized() * speed
	
func _process(_delta):
	pause_menu()
	control_loop()
	sprite_control()
	direction = move_and_slide(direction)

