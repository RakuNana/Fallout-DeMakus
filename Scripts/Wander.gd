extends AnimatedSprite


var speed = 100
var tile_size = 16

var prev_pos = Vector2()
var new_pos = Vector2()
var move_dir = Vector2()

onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2(tile_size,tile_size))
	prev_pos = position
	new_pos = position
	
func _process(delta):
	if ray.is_colliding():
		position = prev_pos
		new_pos = prev_pos
	else:
	
		position += speed * move_dir * delta
		
		if position.distance_to(prev_pos) >= tile_size - speed * delta:
			position = new_pos
		
		
	if position == new_pos:
		control_loop()
		prev_pos = position
		new_pos += move_dir * tile_size
	
func control_loop():
	var Left = Input.is_action_pressed("left")
	var Right = Input.is_action_pressed("right")
	var Up = Input.is_action_pressed("up")
	var Down = Input.is_action_pressed("down")
	
	move_dir.x = -int(Left) + int(Right)
	move_dir.y = -int(Up) + int(Down)
	
	if move_dir.x != 0 && move_dir.y != 0:
		move_dir = Vector2.ZERO

	if move_dir != Vector2.ZERO:
		ray.cast_to = move_dir * tile_size 
