fs = require 'fs'
XmlStream = require 'xml-stream'

stream = fs.createReadStream('../W07-09_5236-jgd_GML/W07-09_5236-jgd.xml')
xml = new XmlStream(stream)

xml.preserve('gml:tupleList', true)
xml.collect('subitem')
xml.on 'endElement: gml:tupleList', (item) ->
	children = item['$children']
	for child in children
		if child.
			indexOf(',850509,') > -1
			console.log child
