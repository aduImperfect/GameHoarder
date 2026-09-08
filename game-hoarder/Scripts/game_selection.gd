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
		if PlayerCharacter.try_collecting:
			set_deferred("monitoring", false)
			owner.is_collected = true
			PlayerCharacter.try_collecting = false

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
