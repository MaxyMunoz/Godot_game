extends CharacterBody2D

var velocidad =40
const  gravedad = 300
var salto=200
var screen_size
var ani

func _ready():
	screen_size=get_viewport_rect().size

func _physics_process(delta):
	velocity.y += gravedad*delta
	if Input.is_action_pressed("CAMINAR"):
		velocity.x= velocidad
		ani=1
	
	elif  Input.is_action_pressed("RETROCEDER"):
		velocity.x = -velocidad
		ani=-1
	elif  Input.is_action_pressed("correr atras"):
		velocity.x =- velocidad*3
		ani =-2
	else:
		velocity.x = 0
		ani=0
		$AnimatedSprite2D.play("detenido")
	if Input.is_action_pressed("CORRER adelante"):
		velocity.x=velocidad*3
		ani=2
	elif  Input.is_action_pressed("correr atras"):
		velocity.x =- velocidad*3
		ani =-2
	if velocity.x == 0:
		velocity.x = 0
		ani=0
		$AnimatedSprite2D.play("detenido")
	if is_on_floor():
		if Input.is_action_just_released("SALTAR"):
			velocity.y =-salto

	if ani == 1 or ani == -1:
		$AnimatedSprite2D.play("avanzar")
	elif ani == 2 or ani == -2:
		$AnimatedSprite2D.play("correr")
	if velocity.x < 0 if  velocity.x != 0  else $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	

	move_and_slide()
