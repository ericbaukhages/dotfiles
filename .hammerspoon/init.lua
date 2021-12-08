local terminalEmulator = "kitty"
local useTmuxForTabs = false

-- Global shortcut/hotkey
-- Pulled from: https://gist.github.com/jjaaccoobb/606f96a4d943929e5d36c8949c526d02
hs.hotkey.bind({"cmd", "shift"}, "F", function()
  local app = hs.application.get(terminalEmulator)
  if app then
    if not app:mainWindow() then
      app:selectMenuItem({terminalEmulator, "New OS window"})
    elseif app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  else
    hs.application.launchOrFocus(terminalEmulator)
  end
end)


-- If configured, when terminal launches, open tmux and maximize window
appWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
  if (eventType == hs.application.watcher.launched) then
    if (appName ==terminalEmulator) then
      -- FIXME: testing showed a delay was needed.
      -- `app:mainWindow()` was `nil` at the time of `hs.application.watcher.launched`
      hs.timer.doAfter(0.1, function()
        local app = hs.application.get(terminalEmulator)
        app:mainWindow():maximize(0)
        if (useTmuxForTabs) then
          hs.eventtap.keyStrokes("tmux new-session -A -s main\n")
        end
      end)
    end
  end
end)
appWatcher:start()

-- =================== WINDOW MANAGEMENT ===================

-- Pulled from here: https://spinscale.de/posts/2016-11-08-creating-a-productive-osx-environment-hammerspoon.html
--[[ function factory that takes the multipliers of screen width
and height to produce the window's x pos, y pos, width, and height ]]
function baseMove(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    -- add max.x so it stays on the same screen, works with my second screen
    f.x = max.w * x + max.x
    f.y = max.h * y
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f, 0)
  end
end

local metaKeys = {'ctrl', 'alt', 'cmd'}
-- local metaKeys = {'cmd', 'shift'}

-- feature spectacle/another window sizing apps
hs.hotkey.bind(metaKeys, 'Left', baseMove(0, 0, 0.5, 1))
hs.hotkey.bind(metaKeys, 'Right', baseMove(0.5, 0, 0.5, 1))
hs.hotkey.bind(metaKeys, 'Down', baseMove(0, 0.5, 1, 0.5))
hs.hotkey.bind(metaKeys, 'Up', baseMove(0, 0, 1, 0.5))
hs.hotkey.bind(metaKeys, '1', baseMove(0, 0, 0.5, 0.5))
hs.hotkey.bind(metaKeys, '2', baseMove(0.5, 0, 0.5, 0.5))
hs.hotkey.bind(metaKeys, '3', baseMove(0, 0.5, 0.5, 0.5))
hs.hotkey.bind(metaKeys, '4', baseMove(0.5, 0.5, 0.5, 0.5))
hs.hotkey.bind(metaKeys, 'M', hs.grid.maximizeWindow)
