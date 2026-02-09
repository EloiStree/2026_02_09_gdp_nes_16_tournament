class_name Nes16ParseDevicesMainJoystickToButtonId
extends Node


@export var joystick_horizontal_axis_index:Array[int]= [JOY_AXIS_LEFT_X,JOY_AXIS_RIGHT_X]
@export var joystick_vertical_axis_index:Array[int]= [JOY_AXIS_LEFT_Y, JOY_AXIS_RIGHT_Y]

@export var arrow_left_to_button_id:int=JOY_BUTTON_DPAD_LEFT
@export var arrow_right_to_button_id:int=JOY_BUTTON_DPAD_RIGHT
@export var arrow_down_to_button_id:int=JOY_BUTTON_DPAD_DOWN
@export var arrow_up_to_button_id:int=JOY_BUTTON_DPAD_UP

@export var death_zone_threshold:float=0.3
@export var device_to_joystick_state:Dictionary[int, Vector2] = {}



signal on_parse_to_button_changed(device_index:int, apparition_index:int, button_id:int, pressed:bool)

func push_in_axis(device_index:int , apparition_index:int, axis_index:int, previous_axis_value:float, new_axis_value:float):

	var button_id_to_emit = 0
	var previous = Vector2.ZERO
	var current = Vector2.ZERO

	if not device_to_joystick_state.has(device_index):
		previous = Vector2.ZERO
		device_to_joystick_state[device_index] = Vector2()
	else:
		previous = device_to_joystick_state[device_index]
		current = device_to_joystick_state[device_index]
	
	if axis_index in joystick_horizontal_axis_index:
		current.x = new_axis_value
	if axis_index in joystick_vertical_axis_index:
		current.y = new_axis_value
	device_to_joystick_state[device_index] = current

	if previous.x < death_zone_threshold and current.x >= death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_right_to_button_id, true)
	elif previous.x > death_zone_threshold and current.x <= death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_right_to_button_id, false)

	if previous.x > -death_zone_threshold and current.x <= -death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_left_to_button_id, true)
	elif previous.x < -death_zone_threshold and current.x >= -death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_left_to_button_id, false)

	if previous.y < death_zone_threshold and current.y >= death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_up_to_button_id, true)
	elif previous.y > death_zone_threshold and current.y <= death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_up_to_button_id, false)
	
	if previous.y > -death_zone_threshold and current.y <= -death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_down_to_button_id, true)
	elif previous.y < -death_zone_threshold and current.y >= -death_zone_threshold:
		on_parse_to_button_changed.emit(device_index, apparition_index, arrow_down_to_button_id, false)
