ui = {
  redraw = {},
  key = {},
  enc = {},
  dirty = true,
  update = function()
    while true do
      if ui.dirty then
        ui.dirty = false
        redraw()
      end
      clock.sync(1/60)
    end
  end,
  init = function() clock.run(ui.update) end
}


function redraw()
  screen.clear()
  ui.redraw[state.page]()
  screen.update()
end

function key(n,z)
  ui.key[state.page](n,z)
end

function enc(n,d)
  ui.enc[state.page](n,d)
end


-------- SETUP

ui.redraw.setup = function()
  screen.move(20,20)
  screen.text("here "..num.." - "..num2)
end

ui.key.setup = function(n,z)
  if n==3 and z==1 then
    num = num+1
    ui.dirty = true
  end
end

ui.enc.setup = function(n,d)
  if n==3 then
    num2 = num2 + d
    ui.dirty = true
  end
end


-------- CUT

ui.redraw.cut = function() end
ui.key.cut = function() end
ui.enc.cut = function() end
