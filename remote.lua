local kb = libs.keyboard;
local timer = libs.timer;
local tid;

events.focus = function ()
    tid = timer.interval(function ()
      updateInfo();
    end, 500);
end

events.blur = function ()
    timer.cancel(tid);
end

events.postaction = function ()
  updateInfo();
end

function updateInfo()
	cmd = "deadbeef --nowplaying-tf '$select($add(%rating%,1),☆;☆;☆;☆;☆,★;☆;☆;☆;☆,★;★;☆;☆;☆,★;★;★;☆;☆,★;★;★;★;☆,★;★;★;★;★)$ifequal([%loved%], 1, ;💔,;❤)|$select(%lang%,OT,EN) ( $select($add(%rating%,1),☆ ☆ ☆ ☆ ☆,★ ☆ ☆ ☆ ☆,★ ★ ☆ ☆ ☆,★ ★ ★ ☆ ☆,★ ★ ★ ★ ☆,★ ★ ★ ★ ★) )$ifequal([%loved%], 1, ❤ ,) [(%year%)] [%artist% -] $if2(%title%,%filename%) [(%genre%)]'"
	local pout = "";
	local presult = 0;
	local perr = "";

	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	stars, res = string.match(pout, "(.*)%|(.*)")
	s1, s2, s3, s4, s5, s6 = string.match(stars, "(.*)%;(.*)%;(.*)%;(.*)%;(.*)%;(.*)")
	libs.server.update(
		{ id = "title", text = res },
		{ id = "star1", text = "" .. s1 },
		{ id = "star2", text = "" .. s2 },
		{ id = "star3", text = "" .. s3 },
		{ id = "star4", text = "" .. s4 },
		{ id = "star5", text = "" .. s5 },
		{ id = "loveit", text = "" .. s6 }
	);
end

--@help Refresh Meta
actions.refresh_info = function ()
	updateInfo();
end

--@help Launch action
actions.launch = function ()
	updateInfo();
end

--@help Lower system volume
actions.volume_down = function()
	kb.press("volumedown");
end

--@help Raise system volume
actions.volume_up = function()
	kb.press("volumeup");
end

--@help Toggle play/pause
actions.play_pause = function ()
	cmd = "screen -dmS dbeef deadbeef --play-pause"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Next playlist item
actions.next = function ()
	cmd = "screen -dmS dbeef deadbeef --next"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Previous playlist item
actions.previous = function ()
	cmd = "screen -dmS dbeef deadbeef --prev"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Stop playback
actions.stop = function ()
	cmd = "screen -dmS dbeef deadbeef --stop"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Play random song
actions.random_song = function ()
	cmd = "screen -dmS dbeef deadbeef --random"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Start DeadBeef in background
actions.start_dbeef = function ()
	cmd = "screen -dmS foobar playonlinux --run Foobar2000"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Exit DeadBeef
actions.stop_dbeef = function ()
	cmd = "screen -X -S foobar quit"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Tag Lang EN
actions.lang_en = function ()
	kb.stroke("ctrl","lwin","numdivide");
end

--@help Tag Lang OT
actions.lang_ot = function ()
	kb.stroke("ctrl","lwin","nummultiply");
end

--@help Copy to English Lang Favourites
-- Command that runs : cp -f %F /home/raven/Downloads/Music/Collection/English/
actions.fav_it_en = function ()
	kb.stroke("ctrl","lwin","num7");
end

--@help Copy to Others Favourites
-- Command that runs : cp -f %F /home/raven/Downloads/Music/Collection/Others/
actions.fav_it_ot = function ()
	kb.stroke("ctrl","lwin","num8");
end

--@help Remove from Favourites
-- Command that runs : rm /home/raven/Downloads/Music/Collection/*/%f
actions.unfav_it = function ()
	kb.stroke("ctrl","lwin","num9");
end

--@help Rate Song 0 Star
actions.star_0 = function ()
  kb.stroke("ctrl","lwin","num0");
end

--@help Rate Song 1 Star
actions.star_1 = function ()
  kb.stroke("ctrl","lwin","num1");
end

--@help Rate Song 2 Star
actions.star_2 = function ()
  kb.stroke("ctrl","lwin","num2");
end

--@help Rate Song 3 Star
actions.star_3 = function ()
  kb.stroke("ctrl","lwin","num3");
end

--@help Rate Song 4 Star
actions.star_4 = function ()
  kb.stroke("ctrl","lwin","num4");
end

--@help Rate Song 5 Star
actions.star_5 = function ()
  kb.stroke("ctrl","lwin","num5");
end

--@help Love the Song
actions.love_it = function ()
  kb.stroke("ctrl","lwin","num6");
end

--@help UnLove the Song
actions.unlove_it = function ()
  kb.stroke("ctrl","lwin","numaddition");
end
