extends ProgressBar

class_name CurrencyMeter

static var tempValAccumulate : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempValAccumulate = 0.0
	print("Value for this is: ", value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for k in PlayerCharacter.collectedgames.size():
		tempValAccumulate += PlayerCharacter.collectedgames[k].game_value
	value = max_value - tempValAccumulate
	tempValAccumulate = 0.0

	print(PlayerCharacter.collectedgames.size())
