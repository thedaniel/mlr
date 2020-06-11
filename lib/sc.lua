sc = {}

function sc.init()
  params:set("softcut_level",1)
  params:set("cut_input_adc",1)

  FADE = 0.1

  for i=1,4 do
    softcut.enable(i,1)
    softcut.level_input_cut(1, i, 1.0)
    softcut.level_input_cut(2, i, 1.0)
    softcut.fade_time(i,FADE)
    softcut.level_slew_time(i,0.1)
    softcut.rate_slew_time(i,0)
    softcut.loop(i,1)
  end
end

function sc.set_clip(g)
  softcut.loop_start(g,clip[track[group[g].track].clip].pos_start)
  softcut.loop_end(g,clip[track[group[g].track].clip].pos_end)
  softcut.buffer(g,clip[track[group[g].track].clip].ch)
end


function sc.set_level(g)
  softcut.level(g,group[g].level)
  softcut.pan(g,group[g].pan)
end

function sc.set_rec(g)
  softcut.pre_level(g,1)
  softcut.rec_level(g,0)
end

function sc.set_play(g)
  softcut.play(g,1)
  softcut.rec(g,0)
end

