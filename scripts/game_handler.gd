extends Node

var MONEY: int = 1000
var isInterfacing = false

enum SHOP_BUY {
	cropbox = 100,
	grapes = 20,
	wheat = 10
}

enum SHOP_SELL {
	grapes = 100,
	wheat = 80
}

func _ready():
	pass
	
func toggleInterfacing():
	if isInterfacing:
		isInterfacing = false
		_interface_exitted()
	else:
		isInterfacing = true
		_interface_exitted()
			
func _interface_exitted():
	pass
	
func _interface_entered():
	pass
