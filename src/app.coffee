require './globals.coffee'
root_element = document.getElementById 'root'
root_000 = require './components/root_000_.coffee'
root_component = root_000
window.onload = =>
    rectangle = root_element.getBoundingClientRect()
    window.window_width = rectangle.width
    window.window_height = rectangle.height

    debounce = (func, wait, immediate) ->
        timeout = 'scoped here'
        ->
            context = @
            args = arguments
            later = ->
                timeout = null
                if not(immediate) then func.apply(context, args)
            callNow = immediate and not(timeout)
            clearTimeout(timeout)
            timeout = setTimeout(later, wait)
            if callNow then func.apply(context, args)

    set_boundingRect = ->
        rectangle = root_element.getBoundingClientRect()
        window.window_width = rectangle.width
        window.window_height = rectangle.height
        React_DOM.render root_component(), root_element


    window.onresize = debounce(set_boundingRect, 200, false)

    React_DOM.render root_component(), root_element
