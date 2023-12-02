extends CharacterBody2D

var velocidad: int = 50
var perseguir: bool = false

func _ready():
	$AnimatedSprite2D.play("caminando")
	velocity.x = -velocidad

func _physics_process(delta):
	detectar()
	if !perseguir:
		if is_on_wall():
			if $AnimatedSprite2D.flip_h == true:
				$AnimatedSprite2D.flip_h = false 
				velocity.x = velocidad
				$AnimatedSprite2D.play("caminando")	
			else:
				$AnimatedSprite2D.flip_h=true
				velocity.x = -velocidad 
	move_and_slide()

func detectar():
	if $derecha.is_colliding():
		var obj = $derecha.get_collider()
		if obj.is_in_group("player"):
			print(obj.name)
			
	if $izquierda.is_colliding():
		var obj =  $izquierda.get_collider()
		if obj.is_in_group("player"):
			print(obj.name)
