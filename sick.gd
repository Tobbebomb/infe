extends CharacterBody2D

@onready var animatedsprite :=$AnimatedSprite2D
var label = "sick"
var sceneSick = preload("res://sick.tscn")
var sceneFrisk = preload("res://frisk.tscn")
var sceneDead = preload("res://dead.tscn")
var sceneGod = preload("res://god.tscn")
var speed = 50
var target = position
var rng = RandomNumberGenerator.new()

var rull = 0
var rulle = 0
func _ready():
	$Timer2.start()
	target = Vector2(rng.randi_range(10,1150),rng.randi_range(10,600))
	animatedsprite.play("defult")
	$Timer.start()


func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	move_and_slide()



func _on_timer_timeout() -> void:
	target = Vector2(rng.randi_range(10,1150),rng.randi_range(10,600))

func _on_timer_2_timeout() -> void:
	rulle = rng.randi_range(1,4)
	if rulle == 2:
			var instace2 = sceneDead.instantiate()
			instace2.global_position = global_position
			get_parent().add_child(instace2)
			queue_free()
	elif rulle == 1:
		var instace3 = sceneFrisk.instantiate()
		instace3.global_position = global_position
		get_parent().add_child(instace3)
		queue_free()
	elif rulle == 3:
		var instace4 = sceneGod.instantiate()
		instace4.global_position = global_position
		get_parent().add_child(instace4)
		queue_free()




func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.label == "frisk":
		rull = rng.randi_range(1,3)
		if rull == 2:
			var instace = sceneSick.instantiate()
			instace.global_position = body.global_position
			get_parent().add_child(instace)
			body.queue_free()
			print("hi")
		
	elif body.name == "sick":
		pass
		
	elif body.name == "god":
		pass
		
		
	
#rull = rng.randi_range(1,3)
		#if rull == 2
