extends ProgressBar

class_name TimeMeter

@export var timeCounterDelay : float = 0.0
@export var timeCounterMax : float
@export var timeSpeed : float
static var timerZeroStatic : float
static var gameFinished : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeCounterDelay = 0.0
	timerZeroStatic = value
	gameFinished = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if gameFinished:
		return

	if PlayerCharacter_0.atFinalPos_0 && PlayerCharacter_1.atFinalPos_1:
		gameFinished = true

	if timeCounterDelay < timeCounterMax:
		timeCounterDelay += _delta * timeSpeed
		return

	value -= 1.0
	timerZeroStatic = value
	timeCounterDelay = 0.0
