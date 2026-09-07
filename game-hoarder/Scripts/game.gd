extends Node2D

@export var tex : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_child(0).get_child(1).texture = tex


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
