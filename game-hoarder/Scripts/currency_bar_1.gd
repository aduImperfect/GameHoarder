extends ProgressBar

class_name CurrencyMeter_1

static var tempValAccumulate_1 : float = 0.0
static var tempValAccumulateStatic_1 : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempValAccumulate_1 = 0.0
	tempValAccumulateStatic_1 = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for k in PlayerCharacter_1.collectedgames_1.size():
		tempValAccumulate_1 += PlayerCharacter_1.collectedgames_1[k].game_value
	value = max_value - tempValAccumulate_1
	tempValAccumulateStatic_1 = value
	tempValAccumulate_1 = 0.0
