extends CharacterBody2D

class_name PlayerCharacter_0

@export var move_speed : float
@export var is_moving : bool = false
static var try_collecting_0 : bool = false
static var collectedgames_0 : Array[Node2D]
static var atFinalPos_0 : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_moving = false
	try_collecting_0 = false
	atFinalPos_0 = false
	collectedgames_0.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (CurrencyMeter_0.tempValAccumulateStatic_0 <= 0.0) || (TimeMeter.timerZeroStatic <= 0.0):
		global_position = Vector2(700.0, 565.0)
		atFinalPos_0 = true
		for k in collectedgames_0.size():
			collectedgames_0[k].is_displayed = true
		return

	try_collecting_0 = false
	if Input.is_action_just_pressed("ui_pickup_0"):
		try_collecting_0 = true

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_move_left_0"):
		position.x -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_right_0"):
		position.x += _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_up_0"):
		position.y -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_down_0"):
		position.y += _delta * move_speed
		is_moving = true
	else:
		is_moving = false
	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass
