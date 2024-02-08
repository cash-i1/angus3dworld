extends Camera3D

var mouse_delta = Vector2(0,0)
var last_mouse_delta: Vector2 = Vector2(0,0)

@onready var body = $".."

func _ready():
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
    if event is InputEventMouseMotion:
        mouse_delta = event.relative 

func can_rotate():
    return true

func _process(delta):
    # if Input.is_key_pressed(KEY_ESCAPE):
    #     get_tree().quit()
    if Input.is_key_pressed(KEY_ESCAPE):
        if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
            Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
        else:
            Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    if Input.is_key_pressed(KEY_V):
        get_tree().paused = !get_tree().paused 

    if can_rotate():
        rotation.x -= mouse_delta.y * 0.01
        body.rotation.y -= mouse_delta.x * 0.01

        # Clamp rotation to prevent camera flipping
        rotation.x = clamp(rotation.x, -1.5, 1.5)
        
        # Reset mouse delta
        mouse_delta = Vector2.ZERO
