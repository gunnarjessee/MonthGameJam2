extends Label

func _ready():
	GameHandler.MONEY_TEXT = self
	GameHandler.MONEY_TEXT.text = str(GameHandler.MONEY)
