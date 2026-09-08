extends ProgressBar

class_name TimeMeter

@export var timeCounterDelay : float = 0.0
@export var timeCounterMax : float
@export var timeSpeed : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeCounterDelay = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if timeCounterDelay < timeCounterMax:
		timeCounterDelay += _delta * timeSpeed
		return

	value -= 1.0
	timeCounterDelay = 0.0
