extends CharacterBody2D

var speed = 120
var direccion = 0.0
const gravity = 9
var salto = 250
var screen_size

@onready var anim = $AnimationPlayer
@onready var sprite =$Sprite2D

func _ready():
	screen_size=get_viewport_rect().size
	pass

func _physics_process(delta):
	direccion= Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * speed
	if direccion != 0:
		anim.play("caminar")
	else:
		anim.play("detenido")
	sprite.flip_h = direccion < 0 if  direccion != 0  else sprite.flip_h
	if is_on_floor() and Input.is_action_just_pressed("SALTAR"):
		velocity.y -=salto
		
	if !is_on_floor():
		velocity.y += gravity
	if velocity.y <0:
		anim.play("saltar")
	else :
		anim.play()
	position = position.clamp(Vector2.ZERO,screen_size)
	
	move_and_slide()
