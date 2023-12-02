extends CharacterBody2D

var velocidad: int = 50
var vel_perseguir: int = 100
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
	if $detectores/derecha.is_colliding():
		var obj = $detectores/derecha.get_collider()
		if obj.is_in_group("player"):
				print("hola"+obj.name)
			
	if $detectores/izquierda.is_colliding():
		var obj =  $detectores/izquierda.get_collider()
		var grupo = obj.get_groups()
		print(grupo[0])
		if obj.is_in_group("player"):
			print(obj.name)
