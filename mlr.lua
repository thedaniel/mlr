-- mlr
-- 2.0.0 @tehn

include("lib/ui")
include("lib/grid")

state = {
  page = "setup"
}

function page(x)
  state.page = x
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
