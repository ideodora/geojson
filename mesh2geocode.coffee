fs = require 'fs'
byline = require 'byline'

stream = byline fs.createReadStream('kiso.csv'),
	encoding: 'utf8'

stream.on 'data', (line) ->

	# console.log line
	# mesh_code 10keta
	mesh_code = line.substr(0, 10)

	code12 = parseInt(mesh_code.substr(0, 2))
	code5 = parseInt(mesh_code.substr(4, 1))
	code7 = parseInt(mesh_code.substr(6, 1))
	code9 = parseInt(mesh_code.substr(8, 1))

	code34 = parseInt(mesh_code.substr(2, 2))
	code6 = parseInt(mesh_code.substr(5, 1))
	code8 = parseInt(mesh_code.substr(7, 1))
	code10 = parseInt(mesh_code.substr(9, 1))

	lat = 0.0 + (((code12 / 1.5) * 3600) + ((code5 * 5) * 60) + (code7 * 30) + (code9 * 3) ) / 3600
	lon = 0.0 + (((code34 + 100) * 3600) + ((code6 * 7.5) * 60) + (code8 * 45) + (code10 * 4.5) ) / 3600

	lat_1 = 0.0 + (3 / 3600)
	lon_1 = 0.0 + (4.5 / 3600)

	console.log '{"type": "Feature",
	"geometry": {
		"type": "Polygon",
		"coordinates": [
			[[' + lon + ',' + lat + '],[' + (lon + lon_1) + ',' + lat + '],[' + (lon + lon_1) + ',' + (lat + lat_1) + '],[' + (lon + lon_1) + ',' + lat + '],[' + lon + ',' + lat + ']]
		]
		}
	},'