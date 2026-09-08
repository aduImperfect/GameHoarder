extends Area2D

@export var gameTex : Sprite2D
@export var origColour : Color
@export var currColour : Color

@export var playerInRegion : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origColour = Color(1.0, 1.0, 1.0, 0.5)
	currColour = Color(1.0, 1.0, 1.0, 2.0)
	playerInRegion = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if playerInRegion:
		gameTex.modulate = currColour
		if PlayerCharacter_0.try_collecting_0:
			if CurrencyMeter_0.tempValAccumulateStatic_0 > 0:
				set_deferred("monitoring", false)
				owner.is_collected = true
				owner.owned_by = 0
				PlayerCharacter_0.collectedgames_0.append(owner)
				PlayerCharacter_0.try_collecting_0 = false
		if PlayerCharacter_1.try_collecting_1:
			if CurrencyMeter_1.tempValAccumulateStatic_1 > 0:
				set_deferred("monitoring", false)
				owner.is_collected = true
				owner.owned_by = 1
				PlayerCharacter_1.collectedgames_1.append(owner)
				PlayerCharacter_1.try_collecting_1 = false
	else:
		gameTex.modulate = origColour

func _on_body_entered(_body: Node2D) -> void:
	if !_body.name.contains("Player"):
		return
	
	playerInRegion = true

func _on_body_exited(_body: Node2D) -> void:
	if !_body.name.contains("Player"):
		return

	playerInRegion = false
