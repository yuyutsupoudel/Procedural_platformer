extends Node2D
var j = 0
onready var player = preload("res://Player.tscn")
func _ready():
	Global.world = self

func _exit_tree():
	Global.world = null

func instance_node(node,location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = Vector2(location.x,location.y+24)
	
	var node_instance2 = node.instance()
	add_child(node_instance2)
	node_instance2.global_position = Vector2(location.x,location.y-24)
	
	if j==0:
		#generate player
		var player_instance = player.instance()
		add_child(player_instance)
		player_instance.global_position = Vector2(location.x+18,location.y-8)
		
		var node_instance3 = node.instance()
		add_child(node_instance3)
		node_instance3.global_position = Vector2(location.x,location.y+8)
		
		var node_instance4 = node.instance()
		add_child(node_instance4)
		node_instance4.global_position = Vector2(location.x,location.y+16)
		
		var node_instance5 = node.instance()
		add_child(node_instance5)
		node_instance5.global_position = Vector2(location.x,location.y-8)
		
		var node_instance6 = node.instance()
		add_child(node_instance6)
		node_instance6.global_position = Vector2(location.x,location.y-16)
		
		var node_instance7 = node.instance()
		add_child(node_instance7)
		node_instance7.global_position = Vector2(location.x,location.y)
		j=j+1
