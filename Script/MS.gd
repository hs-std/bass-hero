extends AudioStreamPlayer
@export var bpm := 120

# Tracking the beat and song position
@onready var spec = AudioServer.get_bus_effect_instance(0, 0, 0)

var song_position = 0.0
var song_position_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var ctrl = 0
var lane
var d
var f = 0

# Determining how close to the beat an event is
var closest = 0
var time_off_beat = 0.0


signal beat(position)

	
	
	
func _process(delta):
	d = spec.get_magnitude_for_frequency_range(20,20+5)
#	d = linear2db(d.length())
	d = d.length()
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		if song_position < 165:
			_report_beat()


func _report_beat():
	lane = int(((song_position * d) * -1)/100)
	if lane > 31:
		lane = int(lane/10)
	if lane > 100:
		lane = int(lane/100)
	if lane == 0 or lane == 4 or lane == 8 or lane == 12 or lane == 16 or lane == 20 or lane == 24 or lane == 28:
		lane = 0
	elif lane == 1 or lane == 5 or lane == 9 or lane == 13 or lane == 17 or lane == 21 or lane == 25 or lane == 29:
		lane = 1
	elif lane == 2 or lane == 6 or lane == 10 or lane == 14 or lane == 18 or lane == 22 or lane == 26 or lane == 30:
		lane = 2
	elif lane == 3 or lane == 7 or lane == 11 or lane == 15 or lane == 19 or lane == 23 or lane == 27 or lane == 31:
		lane = 3
	elif lane < 0:
		lane = 0
	if song_position_in_beats != ctrl:
		emit_signal("beat", lane)
		ctrl = song_position_in_beats

