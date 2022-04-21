extends Label

export (String, 'Wheat', 'Grapes', 
	'Potato', 'Carrot', 'Beet') var cropType


func _ready():
	match cropType:
		'Grapes':
			self.text = '$' + String(GameHandler.SHOP_BUY.grapes)
		'Wheat':
			self.text = '$' + String(GameHandler.SHOP_BUY.wheat)
		'Carrot':
			self.text = '$' + String(GameHandler.SHOP_BUY.carrot)
		'Potato':
			self.text = '$' + String(GameHandler.SHOP_BUY.potato)
