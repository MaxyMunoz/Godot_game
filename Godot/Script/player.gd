extends CharacterBody2D

var velocidad : int = 50
var salto : int = 300
var gravedad : int = 300
var accion : String
var atacar : bool = false

func _physics_process(delta):
	
	velocity.y += gravedad*delta
	if atacar == false:
		if Input.is_action_pressed("CAMINAR"):
			velocity.x = velocidad
			$AnimatedSprite2D.flip_h = false
			accion = "caminar"
		elif Input.is_action_pressed("RETROCEDER"):
			velocity.x =-velocidad
			$AnimatedSprite2D.flip_h = true
			accion = "retroceder"
		else:
			accion = ""
			velocity.x = 0
		if Input.is_action_pressed("CORRER adelante"):
			velocity.x = velocidad*2
			$AnimatedSprite2D.flip_h = false
			accion="correr"
		elif  Input.is_action_pressed("correr atras"):
			velocity.x = velocidad *-2
			$AnimatedSprite2D.flip_h = true
			accion = "correr atras"

		if is_on_floor():
			if Input.is_action_just_pressed("SALTAR"):
				velocity.y =-salto
		if Input.is_action_just_pressed("atacar"):
			atacar=true
	else:
		$AnimatedSprite2D.play("atacar")
		await ($AnimatedSprite2D.animation_finished)
		atacar=false
		
	animacionAciton(accion)
	
	move_and_slide()

func animacionAciton(accion):
	if accion == "correr" or accion == "correr atras":
		$AnimatedSprite2D.play("correr")
	elif accion == "caminar" or accion == "retroceder":
		$AnimatedSprite2D.play("avanzar")

	else:
		$AnimatedSprite2D.play("detenido")
