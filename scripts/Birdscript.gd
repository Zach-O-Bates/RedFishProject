extends RigidBody2D

var tracking = false
var startPos = Vector2()
var kickDir = Vector2()

func _input(evt):
	if evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT:
		if evt.is_pressed():
			tracking = true
			startPos = evt.position
		else:
			tracking = false
			
			
			kickDir = evt.position - startPos
			gravity_scale = 1

			
			apply_impulse(kickDir.normalized() * 1000)
		
			
