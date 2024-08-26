extends Node3D

@onready var rotationPillar: Node3D = $RotationPillar

var __rotationSpeed: float = 100
var __level = 1
var __levelData: LevelData
var __nextPosition : Vector3 = Vector3.ZERO

func _ready() -> void:
	__LoadLevel()
	__AddSegmentsBlocks()

func _process(delta: float) -> void:
	__HandleMovement(delta)

func __HandleMovement(delta : float):
	if Input.is_action_pressed("left"):
		rotationPillar.rotate(Vector3.UP, - deg_to_rad(__rotationSpeed * delta))
	elif Input.is_action_pressed("right"):
		rotationPillar.rotate(Vector3.UP, deg_to_rad(__rotationSpeed * delta))

func __LoadLevel():
	__levelData = GlobalFunctions.LoadLevel(__level)

func __AddSegmentsBlocks():
	for segmentBlock in __levelData.SegmentBlocks:
		var instance = load("res://components/segment_block.tscn").instantiate() as SegmentBlock
		instance.BlockData = segmentBlock
		rotationPillar.add_child(instance)
		instance.global_position = __nextPosition
		__nextPosition = instance.NextPosition
		instance.LoadSegments()
