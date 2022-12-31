tool
extends Control

#var slot_inst

const SlotClass = preload("res://slot_model1.gd") #I never thought it can be used as a class other than being a const.
onready var inventory_slots = $GridContainer
var holding_item = null


func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])


func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item: #Place holding item to slot
					slot.putIntoSlot(holding_item)
					holding_item = null
				else:
					#When taking another item while it's still holding another item.
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()
			pass

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#slot_inst.get_node("TextureRect").rect_scale = Vector2(4,4)
	pass






# Called when the node enters the scene tree for the first time.
func _ready_trash():
	
	#if Engine.is_editor_hint():
#	for i in range(10):
#		slot_inst = load("res://slot_model0.tscn").instance()
#		#print( slot_inst.get_node("TextureRect").rect_scale )
#
#		$HFlowContainer.add_child(slot_inst)
#
#		yield(get_tree().create_timer(0.01), "timeout")
#
#		print(slot_inst.get_node("TextureRect").rect_scale)
#		slot_inst.get_node("TextureRect").rect_scale = Vector2(2,2)
#		print(slot_inst.get_node("TextureRect").rect_scale)
	
	
	
	
	pass # Replace with function body.
