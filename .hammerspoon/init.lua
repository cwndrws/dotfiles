-- Fullscreen current window
hs.hotkey.bind({"cmd", "alt"}, "F", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "R", function()
    hs.reload()
end)

hs.hotkey.bind({"cmd", "alt"}, "S", function()
    hs.caffeinate.startScreensaver()
end)

-- Move current window to next monitor
hs.hotkey.bind({"cmd", "alt"}, "N", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local n = screen:next()
    local new_win = win:moveToScreen(n)
    local f = new_win:frame()
    local max = n:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    new_win:setFrame(f)
end)

-- Move current window to previous monitor
hs.hotkey.bind({"cmd", "alt"}, "P", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local p = screen:previous()
    local new_win = win:moveToScreen(p)
    local f = new_win:frame()
    local max = p:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    new_win:setFrame(f)
end)

-- Move current window to left half of screen
hs.hotkey.bind({"cmd", "alt"}, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Move current window to right half of screen
hs.hotkey.bind({"cmd", "alt"}, "L", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Make the current window occupy the top half of the screen, maintaining its
-- current width and horizontal position.
hs.hotkey.bind({"cmd", "alt"}, "K", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y
    f.h = max.h / 2
    win:setFrame(f)
end)

-- Make the current window occupy the bottom half of the screen maintaining its
-- current width and horizontal position
hs.hotkey.bind({"cmd", "alt"}, "J", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y + (max.h / 2)
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt"}, "C", function()
    hs.spotify.displayCurrentTrack()
end)

hs.alert.show("Config loaded")
