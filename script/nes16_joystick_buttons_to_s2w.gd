class_name Nes16JoystickButtonsToS2W extends Resource


@export_group("Joystick Button Mapping") 
@export var joystick_button_as_left_arrow :Array[int] = [JOY_BUTTON_DPAD_LEFT]
@export var joystick_button_as_right_arrow :Array[int] = [JOY_BUTTON_DPAD_RIGHT]
@export var joystick_button_as_down_arrow :Array[int] = [JOY_BUTTON_DPAD_DOWN]
@export var joystick_button_as_up_arrow :Array[int] = [JOY_BUTTON_DPAD_UP]

@export var joystick_button_as_menu_left :Array[int] = [JOY_BUTTON_BACK]
@export var joystick_button_as_menu_right :Array[int] = [JOY_BUTTON_START]
@export var joystick_button_as_button_a :Array[int] = [JOY_BUTTON_A, JOY_BUTTON_B]
@export var joystick_button_as_button_b :Array[int] = [JOY_BUTTON_X, JOY_BUTTON_Y]


@export_group("To S2W Mapping") 
@export var nes_to_int_left_arrow = 1317
@export var nes_to_int_right_arrow = 1313
@export var nes_to_int_down_arrow =  1315
@export var nes_to_int_up_arrow = 1311
@export var nes_to_int_button_a = 1300
@export var nes_to_int_button_b = 1302
@export var nes_to_int_menu_left = 1309
@export var nes_to_int_menu_right = 1308




func get_s2w_value_from_joystick_button( button_id:int) -> int:
	if button_id in joystick_button_as_left_arrow:
		return nes_to_int_left_arrow
	elif button_id in joystick_button_as_right_arrow:
		return nes_to_int_right_arrow
	elif button_id in joystick_button_as_down_arrow:
		return nes_to_int_down_arrow
	elif button_id in joystick_button_as_up_arrow:
		return nes_to_int_up_arrow
	elif button_id in joystick_button_as_menu_left:
		return nes_to_int_menu_left
	elif button_id in joystick_button_as_menu_right:
		return nes_to_int_menu_right
	elif button_id in joystick_button_as_button_a:
		return nes_to_int_button_a
	elif button_id in joystick_button_as_button_b:
		return nes_to_int_button_b
	else:
		return 0
