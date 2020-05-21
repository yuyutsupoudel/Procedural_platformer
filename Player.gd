extends KinematicBody2D
const MOVE_SPEED = 80
const JUMP_FORCE=130
var GRAVITY = 20
const MAX_FALL_SPEED =100
var is_jumpable = true


onready var sprite = $Sprite


var y_velo = 0
var facing_right = false

func _physics_process(delta):

		
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	
	if is_on_ceiling():
		y_velo=GRAVITY
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))

	if Input.is_action_pressed("jump"):
		if is_jumpable:
			y_velo = -JUMP_FORCE
		
	if !is_on_floor():
		cayoteTIme()
		y_velo += GRAVITY
		
	if is_on_floor() and y_velo >= 5:
		y_velo = 5
		
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
	if facing_right and move_dir < 0:
		flip()
	
	if !facing_right and move_dir > 0:
		flip()
  
	if is_on_floor():
		is_jumpable = true
		
func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h

func cayoteTIme():
	yield(get_tree().create_timer(0.1),"timeout")
	is_jumpable = false
