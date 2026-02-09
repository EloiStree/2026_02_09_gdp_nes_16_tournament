
# Convert 16 NES Gamepad to index integer value with one target
class_name Nes16ConvertDevicesButtonsToOneTargetIID extends Node

@export var nes16_joystick_buttons_to_s2w:Nes16JoystickButtonsToS2W
@export var use_debug_print:bool=false

signal on_index_value_target_one(index:int, value:int)

func push_in_joystick_button_from_devices(godot_index:int , apparition_index:int, button_id:int, value_pressed:int):
	var index_value = nes16_joystick_buttons_to_s2w.get_s2w_value_from_joystick_button(button_id)
	if index_value != null:
		if value_pressed:
			index_value +=1000
		if use_debug_print:
			print("Apparition Index: ", apparition_index, " Button ID: ", button_id, " Value Pressed: ", value_pressed, " Mapped Index Value: ", index_value)
		on_index_value_target_one.emit( apparition_index, index_value)
