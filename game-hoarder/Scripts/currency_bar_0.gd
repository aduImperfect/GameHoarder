extends ProgressBar

class_name CurrencyMeter_0

static var tempValAccumulate_0 : float = 0.0
static var tempValAccumulateStatic_0 : float
static var maxValue_0 : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempValAccumulate_0 = 0.0
	maxValue_0 = max_value
	tempValAccumulateStatic_0 = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tempValAccumulateStatic_0 <= 0.0 || PlayerCharacter_0.atFinalPos_0 || TimeMeter.timerZeroStatic <= 0.0: 
		return

	for k in PlayerCharacter_0.collectedgames_0.size():
		tempValAccumulate_0 += PlayerCharacter_0.collectedgames_0[k].game_value
	value = max_value - tempValAccumulate_0
	tempValAccumulateStatic_0 = value
	tempValAccumulate_0 = 0.0
