extends TextEdit

class_name GameEnd

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !PlayerCharacter_0.atFinalPos_0 || !PlayerCharacter_1.atFinalPos_1:
		visible = false
		return

	visible = true
	text = "Games Showcase Stats!!"
	text += "\n"
	text += "Total Currency Each Player Had: " + str(CurrencyMeter_0.maxValue_0) + "\n"
#------------------------------------------------
	text += "\n"
	text += "Player 1 Stats:\n"
	text += "Currency Spent:"
	text += str(CurrencyMeter_0.maxValue_0 - CurrencyMeter_0.tempValAccumulateStatic_0) + "\n"
	text += "Games Collected:\n"
#----------------
	var gameTypesCount_0 : Array[int] = []
	for j in Game_Stats.G_Type.size():
		gameTypesCount_0.append(0)
	for k in PlayerCharacter_0.collectedgames_0.size():
		for i in Game_Stats.G_Type.values():
			if PlayerCharacter_0.collectedgames_0[k].game_type == i:
				gameTypesCount_0[i] += 1
	for j in Game_Stats.G_Type.size():
		if gameTypesCount_0[j] > 0:
			text += "Type_" + Game_Stats.G_Type.find_key(j) as String + ": " + str(gameTypesCount_0[j]) + "\t"
	text += "\n"
#----------------
	var gameWeightsCount_0 : Array[int] = []
	for j in Game_Stats.G_Weight.size():
		gameWeightsCount_0.append(0)
	for k in PlayerCharacter_0.collectedgames_0.size():
		for i in Game_Stats.G_Weight.values():
			if PlayerCharacter_0.collectedgames_0[k].game_weight == i:
				gameWeightsCount_0[i] += 1
	for j in Game_Stats.G_Weight.size():
		if gameWeightsCount_0[j] > 0:
			text += "Weight_" + Game_Stats.G_Weight.find_key(j) as String + ": " + str(gameWeightsCount_0[j]) + "\t"
	text += "\n"
#----------------
	var gameSizesCount_0 : Array[int] = []
	for j in Game_Stats.G_Size.size():
		gameSizesCount_0.append(0)
	for k in PlayerCharacter_0.collectedgames_0.size():
		for i in Game_Stats.G_Size.values():
			if PlayerCharacter_0.collectedgames_0[k].game_size == i:
				gameSizesCount_0[i] += 1
	for j in Game_Stats.G_Size.size():
		if gameSizesCount_0[j] > 0:
			text += "Size_" + Game_Stats.G_Size.find_key(j) as String + ": " + str(gameSizesCount_0[j]) + "\t"
	text += "\n"
#------------------------------------------------
	text += "\n"
	text += "Player 2 Stats:\n"
	text += "Currency Spent:"
	text += str(CurrencyMeter_1.maxValue_1 - CurrencyMeter_1.tempValAccumulateStatic_1) + "\n"
	text += "Games Collected:\n"
#----------------
	var gameTypesCount_1 : Array[int] = []
	for j in Game_Stats.G_Type.size():
		gameTypesCount_1.append(0)
	for k in PlayerCharacter_1.collectedgames_1.size():
		for i in Game_Stats.G_Type.values():
			if PlayerCharacter_1.collectedgames_1[k].game_type == i:
				gameTypesCount_1[i] += 1
	for j in Game_Stats.G_Type.size():
		if gameTypesCount_1[j] > 0:
			text += "Type_" + Game_Stats.G_Type.find_key(j) as String + ": " + str(gameTypesCount_1[j]) + "\t"
	text += "\n"
#----------------
	var gameWeightsCount_1 : Array[int] = []
	for j in Game_Stats.G_Weight.size():
		gameWeightsCount_1.append(0)
	for k in PlayerCharacter_1.collectedgames_1.size():
		for i in Game_Stats.G_Weight.values():
			if PlayerCharacter_1.collectedgames_1[k].game_weight == i:
				gameWeightsCount_1[i] += 1
	for j in Game_Stats.G_Weight.size():
		if gameWeightsCount_1[j] > 0:
			text += "Weight_" + Game_Stats.G_Weight.find_key(j) as String + ": " + str(gameWeightsCount_1[j]) + "\t"
	text += "\n"
#----------------
	var gameSizesCount_1 : Array[int] = []
	for j in Game_Stats.G_Size.size():
		gameSizesCount_1.append(0)
	for k in PlayerCharacter_1.collectedgames_1.size():
		for i in Game_Stats.G_Size.values():
			if PlayerCharacter_1.collectedgames_1[k].game_size == i:
				gameSizesCount_1[i] += 1
	for j in Game_Stats.G_Size.size():
		if gameSizesCount_1[j] > 0:
			text += "Size_" + Game_Stats.G_Size.find_key(j) as String + ": " + str(gameSizesCount_1[j]) + "\t"
	text += "\n"
#------------------------------------------------
	scroll_vertical = INF
