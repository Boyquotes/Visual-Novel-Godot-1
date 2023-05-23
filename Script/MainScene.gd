extends Node


@export var general_text:Node
@export var general_text_timer:Node
@export var general_options:Node
@export var option_scene:PackedScene

@export var script_path:String
@export var tag_dict:Dictionary
var read_script_FA

# 文字的显示模式
var cur_tag


func direct_options(options_text):
	options_text=options_text.split(" ")
	var i=0
	for option_text in options_text:
		var option=option_scene.instantiate()
		option.text=option_text
		option.option_index=i
		i+=1
		$TextPanel/GeneralOptions.add_child(option)
		
	var mm_options=get_tree().get_nodes_in_group("option")
	for mm_option in mm_options:
		mm_option.custom_pressed.connect(test_signal)
		
	general_text.hide()
	general_options.show()


func direct_display(cur_text):
	general_text.text=cur_text
	general_text.visible_characters=0
	general_text_timer.start()
	general_text.show()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if read_script_FA.get_position()<read_script_FA.get_length():
			read_script()


func test_signal(m_index):
	print(m_index)


func read_script():
	var cur_line=read_script_FA.get_line()
	while cur_line=="":
		cur_line=read_script_FA.get_line()
	
	if tag_dict.has(cur_line):
		cur_tag=tag_dict.get(cur_line)
		cur_line=read_script_FA.get_line()
		call(cur_tag,cur_line)
	else:
		call(cur_tag,cur_line)


# Called when the node enters the scene tree for the first time.
func _ready():
	read_script_FA=FileAccess.open(script_path,FileAccess.READ)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
