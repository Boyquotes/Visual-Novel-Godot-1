extends RichTextLabel


func _on_text_timer_timeout():
	visible_characters+=1
	if visible_characters>=text.length():
		$TextTimer.stop()
