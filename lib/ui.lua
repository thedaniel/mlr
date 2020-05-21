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
  screen.aa(1)
  screen.font_face(1)
  ui.redraw[state.page]()
  screen.update()
end

function key(n,z)
  ui.key[state.page](n,z)
end

function enc(n,d)
  ui.enc[state.page](n,d)
end


-------- TRACK

ui.redraw.track = function()
  screen.move(0,12)
  screen.font_size(16)
  screen.text("track")
end

ui.key.track = function(n,z)
  if n==3 and z==1 then
    num = num+1
    ui.dirty = true
  end
end

ui.enc.track = function(n,d)
  if n==3 then
    num2 = num2 + d
    ui.dirty = true
  end
end


-------- CUT

ui.redraw.cut = function()
  screen.move(0,12)
  screen.font_size(16)
  screen.text("cut")
end

ui.key.cut = function() end
ui.enc.cut = function() end


-------- CLIP

ui.redraw.clip = function()
  screen.move(0,12)
  screen.font_size(16)
  screen.text("clip")
end

ui.key.clip = function() end
ui.enc.clip = function() end


-------- PARAM

ui.redraw.param = function()
  screen.move(0,12)
  screen.font_size(16)
  screen.text("param")
end

ui.key.param = function() end
ui.enc.param = function() end
