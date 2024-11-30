class_name LevelIntroDetail extends Node

var description_1: String
var description_2: String
var mini_map: Resource

static func create(description_1: String, description_2: String, mini_map: Resource) -> LevelIntroDetail:
	var instance = LevelIntroDetail.new()
	instance.description_1 = description_1
	instance.description_2 = description_2
	instance.mini_map = mini_map
	return instance
