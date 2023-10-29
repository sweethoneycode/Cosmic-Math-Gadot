class_name StageStats
extends Resource

export var AdditionUnlock := {"0": 1}
export var SubtractionUnlock := {"0": 1}
export var MultiplicationUnlock := {"0": 1}
export var DivisionUnlock := {"0":1, "1": 1}

export var AdditionComplete:= {"0": 0}
export var SubtractionComplete:= {"0": 0}
export var MultiComplete:= {"0": 0}
export var DivisionComplete:= {"0": 0, "1": 0}

func additionComplete(level,stars):
	AdditionComplete[level] = stars
