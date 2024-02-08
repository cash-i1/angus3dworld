extends CanvasLayer

@onready var world_environment = $"../WorldEnvironment"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_energy_multiplier_value_changed(value):
	world_environment.environment.background_energy_multiplier = value
