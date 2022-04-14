extends Node

var gridData = []

const WORLD_SIZE = 25

func _ready():
	print('Initializing Data')
	for x in range(WORLD_SIZE):
		gridData.append([])
		for y in range(WORLD_SIZE):
			gridData[x].append([])
			gridData[x][y] = 0

# see if there is something already in the grid
func checkOccupied(x, y):
	if x > WORLD_SIZE - 1 or y > WORLD_SIZE - 1:
		return false
	
	if gridData[x][y] == 0:
		return false
	return true

func occupy(x, y):
	gridData[x][y] = 1

func empty(x, y):
	gridData[x][y] = 0
