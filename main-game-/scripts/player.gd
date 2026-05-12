extends CharacterBody2D


var max_speed = 200
var accel =1000
var friction = 300
var input = Vector2.ZERO
func _physics_process(delta):
	player_movement(delta)
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) -  int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
func player_movement(delta):
	input = get_input()

	if input == Vector2.ZERO:

		
		if velocity.x > 0:
			$AnimatedSprite2D.play("idel_right")
		elif velocity.x < 0:
			$AnimatedSprite2D.play("idel_left")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("idel_down")
		elif velocity.y < 0:
			$AnimatedSprite2D.play("idel_up")
	else:
		if input.x > 0 :
			$AnimatedSprite2D.play("walk_right")
		if input.x < 0 :
			$AnimatedSprite2D.play("walk_left")
		if input.y > 0 :
			$AnimatedSprite2D.play("walk_down")
		if input.y < 0 :
			$AnimatedSprite2D.play("walk_up")
			

	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction*delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta )
		velocity = velocity.limit_length(max_speed)

	move_and_slide()
 	
