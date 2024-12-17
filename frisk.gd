extends CharacterBody2D

@onready var animatedsprite :=$AnimatedSprite2D
var label = "frisk"
var speed = 50
var target = position
var rng = RandomNumberGenerator.new()

func _ready():
	animatedsprite.play("defult")
	target = Vector2(rng.randi_range(10,1150),rng.randi_range(10,600))
	$Timer.start()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	move_and_slide()



func _on_timer_timeout() -> void:
	target = Vector2(rng.randi_range(10,1150),rng.randi_range(10,600))
