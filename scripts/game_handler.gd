extends Node

var MONEY: int = 1000
var isInterfacing = false
var DEBUG = true
onready var MONEY_TEXT = null

enum SHOP_BUY {
	cropbox = 100,
	grapes = 20,
	wheat = 10,
	carrot = 150,
	potato = 200,
	
}

enum SHOP_SELL {
	grapes = 100,
	wheat = 80,
	cropbox = 80
}

func checkTransaction(itemEnum):
	if itemEnum > MONEY:
		return false
	return true

func sellItem(itemEnum):
	MONEY += itemEnum
	MONEY_TEXT.text = str(MONEY) + "$"
	print(MONEY, ' bank account')

func buyItem(itemEnum):
	MONEY -= itemEnum
	MONEY_TEXT.text = str(MONEY) + "$"

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
