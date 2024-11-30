class_name LevelIntroDetail extends Node

var description_1: String
var description_2: String
var minimap: Resource

static func create(description_1: String, description_2: String, minimap: Resource) -> LevelIntroDetail:
	var instance = LevelIntroDetail.new()
	instance.description_1 = description_1
	instance.description_2 = description_2
	instance.minimap = minimap
	return instance
