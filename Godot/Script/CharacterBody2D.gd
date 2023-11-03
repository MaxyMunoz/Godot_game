extends CharacterBody2D

var salto =250
@export var speed = 200 
var screen_size
const gravity = 1

func _ready():
	screen_size = get_viewport_rect().size 

func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("CAMINAR"):
		velocity.x +=1
	if Input.is_action_pressed("RETROCEDER"):
		velocity.x -=1
	if Input. is_action_pressed("CORRER adelante"):
		velocity.x +=2
	if Input.is_action_pressed("correr atras"):
		velocity.x -=2
	if Input.is_action_just_pressed("SALTAR"):
		velocity.y += -100
		print(velocity.y)
	
	if velocity.x != 0  and velocity.x == 1 or velocity.x == -1:
		velocity = velocity.normalized() * speed/2
		$AnimatedSprite2D.play("avanzar")
		print(velocity)
	elif velocity.x !=1 and velocity.x != 0:
		velocity = velocity.normalized()*speed
		$AnimatedSprite2D.play("correr")
	else:
		$AnimatedSprite2D.play("detenido")
	if velocity.x < 0 if  velocity.x != 0  else $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	if is_on_floor():
		velocity.y += gravity 
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
