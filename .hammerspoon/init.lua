hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x - 10
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    hs.caffeinate.startScreensaver()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
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


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
    hs.spotify.displayCurrentTrack()
end)

hs.alert.show("Config loaded")
