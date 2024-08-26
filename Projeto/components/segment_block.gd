extends Node3D
class_name SegmentBlock

@onready var __segmentPoints: Node3D = $SegmentPoints
@onready var __points = __segmentPoints.get_children()
@onready var __next_point: Marker3D = $NextPoint
@onready var NextPosition = __next_point.global_position

var BlockData : SegmentBlockData
var __rotations = [0, 45, 90, 135, 180, 225, 270, 315]

func LoadSegments():
	if BlockData:
		var index = 0
		for segment in BlockData.Segments:
			__addSegment(__points[index], segment.Type, segment.Rotation)
			index = index + 1
			
func __addSegment(point : Node3D, type : int, rotation : int):
	var segmentPath = ""
	match type:
		0: 
			segmentPath = "res://components/segment_1.tscn"
		1: 
			segmentPath = "res://components/segment_3_4.tscn"
		2: 
			segmentPath = "res://components/segment_1_2.tscn"
		3: 
			segmentPath = "res://components/segment_1_4.tscn"
	var instance = load(segmentPath).instantiate() as MeshInstance3D
	add_child(instance)
	instance.global_position = point.global_position
	instance.rotate_y(deg_to_rad(__rotations[rotation]))
	
