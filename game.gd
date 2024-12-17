extends Node2D
var sceneSick = preload("res://sick.tscn")
var sceneFrisk = preload("res://frisk.tscn")
var sceneDead = preload("res://dead.tscn")
var sceneGod = preload("res://god.tscn")
var ball = RandomNumberGenerator.new()
var dag = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in range(70):
		dag = ball.randi_range(1,4)
		if dag == 2:
			var instace2 = sceneSick.instantiate()
			instace2.global_position = Vector2(ball.randi_range(10,1000),ball.randi_range(10,600))
			add_child(instace2)
		elif dag == 1:
			var instace3 = sceneFrisk.instantiate()
			instace3.global_position = Vector2(ball.randi_range(10,1000),ball.randi_range(10,600))
			add_child(instace3)
		elif dag == 3:
			var instace4 = sceneGod.instantiate()
			instace4.global_position = Vector2(ball.randi_range(10,1000),ball.randi_range(10,600))
			add_child(instace4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
