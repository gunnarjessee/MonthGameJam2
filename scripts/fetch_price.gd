extends Label

export (String, 'Wheat', 'Grapes') var cropType

func _ready():
	match cropType:
		'Grapes':
			self.text = '$' + String(GameHandler.SHOP_BUY.grapes)
		'Wheat':
			self.text = '$' + String(GameHandler.SHOP_BUY.wheat)
