extends Node2D

@export var tex : Texture2D
@export var is_collected : bool
@export var is_displayed : bool
@export var game_value : float
@export var game_type : Game_Stats.G_Type
@export var game_weight : Game_Stats.G_Weight
@export var game_size : Game_Stats.G_Size

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
