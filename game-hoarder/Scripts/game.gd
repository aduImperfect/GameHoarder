extends Node2D

@export var tex : Texture2D
@export var is_collected : bool
@export var is_displayed : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_collected = false
	is_displayed = false
	get_child(0).get_child(1).texture = tex


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_collected:
		global_position = Vector2(-9999.0, -9999.0)
		visible = false

	if is_displayed:
		global_position = PlayerCharacter.owner.global_position + Vector2(0.0, -50.0)
		visible = true
