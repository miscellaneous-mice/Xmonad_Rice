import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Run

import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ThreeColumns
import XMonad.Util.NamedScratchpad
import XMonad.Layout.ResizableTile
import XMonad.Actions.MouseResize
import XMonad.Util.Scratchpad
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

--For polybar
import XMonad.Hooks.EwmhDesktops
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal :: [Char]
myTerminal = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth :: Dimension
--myBorderWidth = 0
myBorderWidth = 3
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask :: KeyMask
myModMask = mod1Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces :: [[Char]]
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor :: [Char]
myNormalBorderColor  = "#43314a"

myFocusedBorderColor :: [Char]
myFocusedBorderColor = "#b4befe"

-- Colors for polybar
color1, color2, color3, color4 :: String
color1 = "#8be9fd"
color2 = "#c792ea"
color3 = "#900000"
color4 = "#2E9AFE"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys :: [(String, X ())]
myKeys =
        [
          ("M-S-r", spawn "xmonad --recompile; xmonad --restart;")        -- Restarts xmonad
        , ("M-S-e", io exitSuccess)-- Quits xmonad
        , ("M-<Space>", spawn "rofi -show run") --Show rofi search menu
        , ("M-c", spawn "rofi -show calc")	-- Open calculator
	, ("M-f", spawn "firefox")	-- Open firefox
	, ("M-t", spawn "thunar")	-- Open file manager
	, ("M-S-s", spawn "scrot -s --delay 1 --line mode=edge ~/Pictures/Screenshots/%Y-%m-%d_%H%M%S-$wx$h_scrot.png") -- Screenshot
	, ("M-p", spawn "rofi -show power-menu -modi power-menu:~/.local/bin/rofi-power-menu") -- Open power menu
        , ("M-S-<Return>", spawn myTerminal)	-- Open terminal
        , ("M-S-c", kill)                         -- Kill the currently focused client
        --, ("M-t", sendMessage (T.Toggle "floats"))       -- Toggles my 'floats' layout
        --, ("M-m", windows W.focusMaster)     -- Move focus to the master window
        , ("M-j", windows W.focusDown)       -- Move focus to the next window
        , ("M-k", windows W.focusUp)         -- Move focus to the prev window
        , ("M-<Return>", windows W.swapMaster)    -- Swap the focused window and the master window
        , ("M-<Tab>", sendMessage NextLayout)                -- Switch to next layout
        , ("M-S-f", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full
        , ("M-<Delete>", withFocused $ windows . W.sink) -- Push floating window back to tile
        , ("M-S-<Delete>", sinkAll)                      -- Push ALL floating windows to tile
        , ("M-S-n", sendMessage $ MT.Toggle NOBORDERS)      -- Toggles noborder
        , ("M-h", sendMessage Shrink)                       -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                       -- Expand horiz window width
	, ("M-S-h", sendMessage MirrorShrink)
	, ("M-S-l", sendMessage MirrorExpand)        
	, ("M-S-t", namedScratchpadAction myScratchPads "terminal")
	, ("M-s", namedScratchpadAction myScratchPads "alsamixer")
        ]

        where
         scratchPad = scratchpadSpawnActionTerminal myTerminal

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
		, NS "alsamixer" spawnAlsa findAlsa manageAlsa
                ]
    where

    spawnAlsa  = myTerminal ++ " -t scratchpad -e alsamixer"
    findAlsa   = title =? "alsamixer"
    manageAlsa = customFloating $ W.RationalRect l t w h
                 where
                 h = 0.5
                 w = 0.6
                 t = 0.2
                 l = 0.2

    spawnTerm  = myTerminal ++ " -t scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
                 where
                 h = 0.5
                 w = 0.6
                 t = 0.2
                 l = 0.2


-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)),

    -- mod-button2, Raise the window to the top of the stack
    ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.

-- ||| Mirror tiled (to enable horizontal master/stack)

-- Makes setting the spacingRaw simpler to write. The spacingRaw
-- module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True


tall     = renamed [Replace "tall"]
           $ limitWindows 12
           $ mySpacing 5
           $ ResizableTall 1 (3/100) (1/2) []

threeCol = renamed [Replace "threeCol"]
           $ limitWindows 7
	   $ mySpacing 5
           $ ThreeCol 1 (3/100) (1/2)

monocle  = renamed [Replace "monocle"]
           $ limitWindows 20
           $ Full


floats   = renamed [Replace "floats"]
           $ limitWindows 20
           $ simplestFloat

myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
               mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ myDefaultLayout
             where
               -- I've commented out the layouts I don't use.
               myDefaultLayout =     tall
                                -- ||| magnify
                                 ||| noBorders monocle
				 ||| threeCol
                                -- ||| floats

-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = (composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore]) <+> namedScratchpadManageHook myScratchPads
               --manageScratchPad

-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--myLogHook :: X ()
--myLogHook = return ()

myLogHook :: D.Client -> PP
myLogHook dbus = def 
	{ ppOutput = dbusOutput dbus
    , ppVisible = wrap ("%{F" ++ color1 ++ "} ") "%{F-}"
    , ppUrgent  = wrap ("%{F" ++ color1 ++ "} ") "%{F-}"
	, ppTitle  = wrap ("%{F" ++ color1 ++ "} ") "%{F-}"
	, ppCurrent = wrap ("%{F" ++ color1 ++ "} ") "%{F-}"
	}
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook :: X ()
myStartupHook = do
  --spawnOnce "xrandr --output LVDS-0 --auto"
  spawnOnce "xrandr --output Virtual1 --mode 1920x1080"
  spawnOnce "~/.fehbg"
  --spawnOnce "picom --animations --animation-for-open-window fly-in -b --experimental-backends"
  spawnOnce "picom --config ~/.config/picom/picom.conf"
  --spawnOnce "picom --experimental-backends"
  --spawnOnce "picom --vsync -b"
  spawnOnce "sh ~/.config/polybar/launch.sh"

  spawnOnce "xsetroot -cursor_name left_ptr"


-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
  --xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.config"
  --xmproc <- spawnPipe "sh ~/.config/polybar/launch.sh &"
  --xmonad $ docks $ defaults xmproc
    xmonad $ ewmh $ docks $ defaults { logHook = dynamicLogWithPP (myLogHook dbus) }


-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings

        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        --logHook            = myLayoutHook, 
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys
