class_name Nes16ConvertDevicesButtonsToFourTargetIID 
extends Node


@export var nes16_joystick_buttons_to_s2w:Nes16JoystickButtonsToS2W
@export var use_debug_print:bool=false

signal on_index_value_target_one(index:int, value:int)
signal on_index_value_target_two(index:int, value:int)
signal on_index_value_target_three(index:int, value:int)
signal on_index_value_target_four(index:int, value:int)





func push_in_joystick_button_from_devices(godot_index:int , apparition_index:int, button_id:int, value_pressed:int):
	var index_value = nes16_joystick_buttons_to_s2w.get_s2w_value_from_joystick_button(button_id)
	var new_index = apparition_index % 4
	var pool_index = apparition_index / 4
	if index_value != null:
		if value_pressed:
			index_value +=1000
		match new_index:
			0:
				on_index_value_target_one.emit(new_index, index_value)
			1:
				on_index_value_target_two.emit(new_index, index_value)
			2:
				on_index_value_target_three.emit(new_index, index_value)
			3:
				on_index_value_target_four.emit(new_index, index_value)    
	if use_debug_print:
		# Print new index and pool index for debugging
		print("New Index: ", new_index, " Pool Index: ", pool_index, " Button ID: ", button_id, " Value Pressed: ", value_pressed)
   
