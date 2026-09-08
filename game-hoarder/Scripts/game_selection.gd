extends Area2D

@export var gameTex : Sprite2D
@export var origColour : Color
@export var currColour : Color

@export var player0InRegion : bool
@export var player1InRegion : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origColour = Color(1.0, 1.0, 1.0, 0.5)
	currColour = Color(1.0, 1.0, 1.0, 2.0)
	player0InRegion = false
	player1InRegion = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if visible == false:
		return

	if !player0InRegion && !player1InRegion:
		gameTex.modulate = origColour
		return

	if player0InRegion:
		gameTex.modulate = currColour
		if PlayerCharacter_0.try_collecting_0:
			if CurrencyMeter_0.tempValAccumulateStatic_0 > 0:
				visible = false
				set_deferred("monitoring", false)
				owner.is_collected = true
				owner.owned_by = 0
				PlayerCharacter_0.collectedgames_0.append(owner)
				PlayerCharacter_0.try_collecting_0 = false
				player0InRegion = false

	if player1InRegion:
		gameTex.modulate = currColour
		if PlayerCharacter_1.try_collecting_1:
			if CurrencyMeter_1.tempValAccumulateStatic_1 > 0:
				visible = false
				set_deferred("monitoring", false)
				owner.is_collected = true
				owner.owned_by = 1
				PlayerCharacter_1.collectedgames_1.append(owner)
				PlayerCharacter_1.try_collecting_1 = false
				player1InRegion = false

func _on_body_entered(_body: Node2D) -> void:
	if !_body.name.contains("Player"):
		return

	if _body.owner.name.contains("0"):
		player0InRegion = true
	
	if _body.owner.name.contains("1"):
		player1InRegion = true

func _on_body_exited(_body: Node2D) -> void:
	if !_body.name.contains("Player"):
		return

	if _body.owner.name.contains("0"):
		player0InRegion = false
	
	if _body.owner.name.contains("1"):
		player1InRegion = false
