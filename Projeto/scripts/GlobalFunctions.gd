extends Node

func LoadLevel(level : int) -> LevelData:
	var file = "res://data/Level_" + str(level) + ".json"
	if not FileAccess.file_exists(file):
		return null		
	return JsonClassConverter.json_file_to_class(LevelData, file)		
