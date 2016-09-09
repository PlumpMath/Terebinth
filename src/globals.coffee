window.c = console.log.bind console
window._ = require 'lodash'
window.React = require 'react'
window.React_DOM = require 'react-dom'
window.Rx = require 'rxjs'
window.gl_mat = require 'gl-matrix'
window.rr = -> React.createFactory(React.createClass.apply(React, arguments))
window.rc = -> React.createFactory.apply(React, arguments)
dom_stuff = {
p, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle,
tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath,
body, linearGradient, stop, g, path, d, polygon, image, pattern,
filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode,
feMerge, radialGradient, foreignObject, text, textArea, ellipse,
pattern, thead, th, tr, tbody
} = React.DOM
for k, v of dom_stuff
    window[k] = v
for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset']
    window[item] = React.createFactory item
