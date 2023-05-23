extends Node


var viewport_size


func limit_in_range(x,a,b):
	return min(max(x,a),b)


func move_background(event):
	var new_pos:Vector2
	
	if event is InputEventMouseMotion:
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
		new_pos=$FixedNode.position+event.relative*0.05
		
	if event is InputEventJoypadMotion:
		Input.mouse_mode=Input.MOUSE_MODE_HIDDEN
		for joypad in Input.get_connected_joypads():
			new_pos.x=Input.get_joy_axis(joypad,JOY_AXIS_RIGHT_X)*30
			new_pos.y=Input.get_joy_axis(joypad,JOY_AXIS_RIGHT_Y)*30
			
	new_pos.x=limit_in_range(new_pos.x,-80,80)
	new_pos.y=limit_in_range(new_pos.y,-45,45)
	$FixedNode.position=new_pos


func _input(event):
	move_background(event)


# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().size_changed.connect(_on_viewport_size_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	pass # Replace with function body.


func _on_load_pressed():
	pass # Replace with function body.


func _on_setting_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()


func _on_viewport_size_changed():
	viewport_size=get_viewport().size
	print("Viewport size is changed to ",viewport_size)
