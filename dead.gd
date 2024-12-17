extends CharacterBody2D

@onready var animatedsprite :=$AnimatedSprite2D
var label = "dead"
var speed = 50
var target = position
var rng = RandomNumberGenerator.new()

func _ready():
	animatedsprite.play("defult")
	animatedsprite.play("boom")
func _physics_process(delta):
	pass
