-- mlr
-- 3.0.0 @tehn
-- l.llllllll.co/mlr

include("lib/data")
include("lib/ui")
include("lib/grid")


function set_page(x)
  state.page = x
  ui.dirty = true
  g.dirty = true
end

function set_window(x)
  state.window = x
  ui.dirty = true
  g.dirty = true
end

num = 0
num2 = 0
num3 = 1


function init()
  ui.init()
  g.init()
end
