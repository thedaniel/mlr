gr = grid.connect()

g = {
  redraw = {},
  key = {},
  dirty = true,
  update = function()
    while true do
      if g.dirty then
        g.dirty = false
        grid_redraw()
      end
      clock.sync(1/60)
    end
  end,
  init = function() clock.run(g.update) end
}


function grid_redraw()
  gr:all(0)
  grid_redraw_nav()
  g.redraw[state.page]()
  gr:refresh()
end

function gr.key(x,y,z)
  if y==1 or y==2 then grid_key_nav(x,y,z)
  else g.key[state.page](x,y,z) end
end


-------- nav (global)

grid_redraw_nav = function()
  gr:led(1,1,state.page == "setup" and 15 or 2)
  gr:led(2,1,state.page == "cut" and 15 or 2)
end

grid_key_nav = function(x,y,z)
  if x==1 and y==1 and z==1 then
    page("setup")
  elseif x==2 and y==1 and z==1 then
    page("cut")
  end
end



-------- SETUP

g.redraw.setup = function()
  gr:led(num3,3,15)
end

g.key.setup = function(x,y,z)
  if z==1 then
    num3 = (num3+1)%16
    g.dirty = true
  end
end


-------- CUT

g.redraw.cut = function() end
g.key.cut = function(x,y,z) end
