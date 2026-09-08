extends CharacterBody2D

class_name PlayerCharacter_1

@export var move_speed : float
@export var is_moving : bool = false
static var try_collecting_1 : bool = false
static var collectedgames_1 : Array[Node2D]
static var atFinalPos_1 : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_moving = false
	try_collecting_1 = false
	atFinalPos_1 = false
	collectedgames_1.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (CurrencyMeter_1.tempValAccumulateStatic_1 <= 0.0) || (TimeMeter.timerZeroStatic <= 0.0):
		global_position = Vector2(570.0, 565.0)
		atFinalPos_1 = true
		for k in collectedgames_1.size():
			collectedgames_1[k].is_displayed = true
		return


	try_collecting_1 = false
	if Input.is_action_just_pressed("ui_pickup_1"):
		try_collecting_1 = true

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_move_left_1"):
		position.x -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_right_1"):
		position.x += _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_up_1"):
		position.y -= _delta * move_speed
		is_moving = true
	elif Input.is_action_pressed("ui_move_down_1"):
		position.y += _delta * move_speed
		is_moving = true
	else:
		is_moving = false
	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass
