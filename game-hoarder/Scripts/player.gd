extends CharacterBody2D

class_name PlayerCharacter

@export var move_speed : float
@export var is_moving : bool = false
static var try_collecting : bool = false
static var collectedgames : Array[Node2D]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_moving = false
	try_collecting = false
	collectedgames.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("ui_pickup")) && (try_collecting == false):
		try_collecting = true

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_move_left"):
		position.x -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_right"):
		position.x += _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_up"):
		position.y -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_down"):
		position.y += _delta * move_speed
		is_moving = true
	else:
		is_moving = false
	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass
