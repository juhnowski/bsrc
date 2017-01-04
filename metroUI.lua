box.cfg{
 snapshot_period = 3600,
 snapshot_count = 3
};

io = require "io"
ui = require "tek.ui"
exec = require "tek.lib.exec"
MenuItem = ui.MenuItem;

scheme = require "pages.scheme";
BK_Sets = require "pages.BK_Sets";
videoreg = require "pages.BK_Sets.videoreg"
ip_camera = require "pages.BK_Sets.ip_camera";
pass = require "pages.enter_pass.password";

metro = require "metro";

--Загрузка раскладок.
video_1x1 = require "pages.layout_screen.video_1x1";
video_2x2 = require "pages.layout_screen.video_2x2";
video_2x3 = require "pages.layout_screen.video_2x3";
video_3x3 = require "pages.layout_screen.video_3x3";

--Загрузка настроек параметров экрана.
screen_sets = require "pages.screen_sets.screen_sets";

station = metro.station;
i = 0;
wi_fi_status = "WiFi: ДА";

ui.Mode = "workbench";

cam_1 = "udp://127.0.0.1:9000 &";
cam_2 = "udp://127.0.0.1:9002 &";
cam_3 = "udp://127.0.0.1:9004 &";
cam_4 = "udp://127.0.0.1:9006 &";
cam_5 = "udp://127.0.0.1:9008 &";
cam_6 = "udp://127.0.0.1:9010 &";
cam_7 = "udp://127.0.0.1:9012 &";
cam_8 = "udp://127.0.0.1:9014 &";
cam_9 = "udp://127.0.0.1:9016 &";

key_num = 1;
LAYOUT_1X1 = 1;
LAYOUT_2X2 = 2;
LAYOUT_3X3 = 3;
LAYOUT_2X3 = 4;
flagLayout = 0;

layoutForm = 0;		--Переменная отвечающая за тип раскладки.

function playfb_1x1()
	ind = 0;
	flagLayout = LAYOUT_1X1;
        os.execute("pkill playfb");
        if key_num == 1 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_1);
        elseif key_num == 2 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_2);
        elseif key_num == 3 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_3);
        elseif key_num == 4 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_4);
	elseif key_num == 5 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_5);
        elseif key_num == 6 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_6);
        elseif key_num == 7 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_7);
	elseif key_num == 8 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_8);
        elseif key_num == 9 then
                os.execute("./playfb -u -sx -a - -x 5 -y 5 -z 3.85 -w 2.63 " .. cam_9);
        end
end


function playfb_3x3()
	ind = 0;
	flagLayout = LAYOUT_3X3;
	os.execute("pkill playfb");
	--[[os.execute("./main_11");
        os.execute("./main_12");
       	--os.execute("./main_13");
	os.execute("./main_14");
      	os.execute("./main_21");
      	os.execute("./main_22");
       	os.execute("./main_31");
      	os.execute("./main_32");
       	os.execute("./main_41");
        os.execute("./main_42");]]
	os.execute("./main");
	os.execute("./playfb -u -sx -a - -x 70 -y 52 -z 1.05 -w 0.65 udp://127.0.0.1:9000 &");
	os.execute("./playfb -u -sx -a - -x 470 -y 52 -z 1.05 -w 0.65 udp://127.0.0.1:9002 &");
        os.execute("./playfb -u -sx -a - -x 872 -y 52 -z 1.05 -w 0.65 udp://127.0.0.1:9004 &");
        os.execute("./playfb -u -sx -a - -x 70 -y 267 -z 1.05 -w 0.65 udp://127.0.0.1:9006 &");
        os.execute("./playfb -u -sx -a - -x 470 -y 267 -z 1.05 -w 0.65 udp://127.0.0.1:9008 &");
        os.execute("./playfb -u -sx -a - -x 872 -y 267 -z 1.05 -w 0.65 udp://127.0.0.1:9010 &");
        os.execute("./playfb -u -sx -a - -x 70 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9012 &");
        os.execute("./playfb -u -sx -a - -x 470 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9014 &");
        os.execute("./playfb -u -sx -a - -x 872 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9016 &");
end

function playfb_2x2()
	ind = 0;
	flagLayout = LAYOUT_2X2;
	os.execute("pkill playfb");
	--[[os.execute("./main_11 &");
        os.execute("./main_12 &");
	--os.execute("./main_13 &");	
	os.execute("./main_14 &");
        os.execute("./main_21 &");]]
	os.execute("./main");
	os.execute("./playfb -u -sx -a - -x 70 -y 52 -z 1.62 -w 1.03 udp://127.0.0.1:9000 &");
        os.execute("./playfb -u -sx -a - -x 672 -y 52 -z 1.62 -w 1.03 udp://127.0.0.1:9002 &");
	os.execute("./playfb -u -sx -a - -x 70 -y 372 -z 1.62 -w 1.03 udp://127.0.0.1:9004 &");
        os.execute("./playfb -u -sx -a - -x 672 -y 372 -z 1.62 -w 1.03 udp://127.0.0.1:9006 &");
end

function playfb_2x3()
	ind = 0;
	flagLayout = LAYOUT_2X3;
	os.execute("pkill playfb");
	--[[os.execute("./main_11 &");
        os.execute("./main_12 &");
        --os.execute("./main_13 &");
	os.execute("./main_14 &");
        os.execute("./main_21 &");
	os.execute("./main_22 &");
        os.execute("./main_31 &");]]
	os.execute("./main");
	os.execute("./playfb -u -sx -a - -x 65 -y 52 -z 2.14 -w 1.4 udp://127.0.0.1:9000 &");	--2.21
	os.execute("./playfb -u -sx -a - -x 850 -y 267 -z 1.135 -w 0.65 udp://127.0.0.1:9002 &");
	os.execute("./playfb -u -sx -a - -x 850 -y 52 -z 1.135 -w 0.65 udp://127.0.0.1:9004 &");
	os.execute("./playfb -u -sx -a - -x 70 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9006 &");
        os.execute("./playfb -u -sx -a - -x 470 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9008 &");
        os.execute("./playfb -u -sx -a - -x 872 -y 480 -z 1.05 -w 0.65 udp://127.0.0.1:9010 &");
end

ind = 0;
cnt = 1;
filename = "/home/usrd/metro.txt"
filename_auto = "/home/usrd/Auto.json"
filename_settings = "/home/usrd/metro/metroUI_ver_1.9.4/settings.json"

app = ui.Application:new
{
	Id = "the-application",
	Children =
	{
		ui.Window:new
		{
			Title = "METRO UI",
			HideOnEscape = true,
			Orientation = "vertical",
			FullScreen = true,
			MaxWidth = 1366;
			MaxHeight = 768;
			Id = "the-window",
			RootWindow = true;
			SizeButton = true;
			cleanup = function(self)
                                ui.Application.cleanup(self);
				os.execute("pkill playfb");
                                os.execute("sudo ./appExit.lua");
                                os.execute("sudo pkill -9 tarantool");
                        end;
			updateInterval = function(self)
                                cnt = cnt + 1;
                                if (cnt % 1000) == 0 then
                                        os.execute("./main_11");
				        os.execute("./main_12");
					--os.execute("./main_13");
					os.execute("./main_14");
					os.execute("./main_21");
					os.execute("./main_22");
					os.execute("./main_31");
					os.execute("./main_32");
                                        os.execute("./main_41");
					os.execute("./main_42");
					cnt = 1;
					ind = ind + 1;
                                end
				if ind > 100 then
					if flagLayout == LAYOUT_3X3 then
						playfb_3x3();
					end
					if flagLayout == LAYOUT_2X2 then
						playfb_2x2();
                                        end
					if flagLayout == LAYOUT_2X3 then
						playfb_2x3();
                                        end
					if flagLayout == LAYOUT_1X1 then
						playfb_1x1();
                                        end
					ind = 0;
				end
				local line;
                                local line_auto;
                                local line_settings;
				for line in io.lines(filename) do
                                        if line == 'KEYUP 0x70' then
                                                metro.onClickF1();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x71' then
                                                metro.onClickF2();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x72' then
                                                metro.onClickF3();
						os.execute("sudo echo > " .. filename);
                                        end
					if line == 'KEYUP 0x73' then
						metro.onClickF4();
						os.execute("sudo echo > " .. filename);
					end
					if line == 'KEYUP 0x74' then
						metro.onClickF5();
						os.execute("sudo echo > " .. filename);
					end
                                        if line == 'KEYUP 0x75' then
                                                metro.onClickF6();
						os.execute("sudo echo > " .. filename);
                                        end
					if line == 'KEYUP 0x78' then
                                                --metro.onClickF9();
                                                os.execute("sudo echo > " .. filename);
						self.Application:quit();
                                        end
                                        if line == 'KEYUP 0x7B' then
                                                metro.onClickF12();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x60' then
                                                metro.onClickNum0();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x61' then
						key_num = 1;
                                                metro.onClickNum1();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x62' then
						key_num = 2;
                                                metro.onClickNum2();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x63' then
						key_num = 3;
                                                metro.onClickNum3();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x64' then
						key_num = 4
                                                metro.onClickNum4();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x65' then
						key_num = 5;
                                                metro.onClickNum5();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x66' then
						key_num = 6;
                                                metro.onClickNum6();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x67' then
						key_num = 7;
                                                metro.onClickNum7();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x68' then
						key_num = 8;
                                                metro.onClickNum8();
						os.execute("sudo echo > " .. filename);
                                        end
	                                if line == 'KEYUP 0x69' then
						key_num = 9;
                                                metro.onClickNum9();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x0D' then
                                                metro.onClickEnter();
						os.execute("sudo echo > " .. filename);
                                        end
                                        if line == 'KEYUP 0x1B' then
                                                metro.onClickEsc();
						os.execute("sudo echo > " .. filename);
                                        end
					for line_auto in io.lines(filename_auto) do
                        	                if #line_auto > 0 then
                                	                metro.autoparse(line_auto)
                                        	        os.execute("echo  > " .. filename_auto)
	                                        end
        	                        end
                	                for line_settings in io.lines(filename_settings) do
	                                        if #line_settings > 0 then
        	                                        metro.parse(line_settings)
                	                                os.execute("echo >" .. filename_settings)
                        	                end
                                	end
				end
                        end,
                        show = function(self, drawable)
                                ui.Window.show(self, drawable);
				layoutForm = LAYOUT_3x3;
                                self:addInputHandler(ui.MSG_INTERVAL, self, self.updateInterval);
                        end,
			hide = function(self)
                                self:remInputHandler(ui.MSG_INTERVAL, self, self.updateInterval);
                                ui.Window.hide(self);
                        end,
			Children =
			{
				ui.Text:new
				{
					--Height = 5;
				};
				ui.Group:new
				{
				Children =
				{
				ui.Text:new
				{
					Width = 30;
				};
				ui.Group:new
				{	
					Orientation = "horizontal";
					Weight = 0x5000;
					Style = "border-width: 0; background-color:black";
					Children =
					{
						ui.Group:new
						{
							Orientation = "horizontal";
							Height = 202;
							Style = "border-width: 0; background-color:black";
							Children =
							{
								ui.Group:new
								{
									Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
									Width = 20;
									Height = 60;
									Children =
									{
										ui.Text:new
										{
											Height = 20;
											Width = 20;
											Style = "font: ui-large; border-width: 0";
											Text = "1";
										};
										ui.Text:new
                                                		                {
                                                                		        Height = 20;
		                                                                        Width = 20;
                		                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                		                                        Text = "A1";
                                                		                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
										ui.Text:new
		                                                                {
                		                                                        Height = 20;
                                		                                        Width = 20;
                                                		                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                		        Text = "C";
		                                                                };
									}
								};
								ui.Group:new
								{
									Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
									Children =
									{
										ui.Text:new
										{
											Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
										};
										ui.Text:new
                                                				{
				                                                        Style = "background-color:black";
											Height = 182;
				                                                        Text = "1";
                                				                };
									}
								};
							}
						};
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "2";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "B1";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                        Height = 20;
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
                                                        --Height = "free";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "3";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "D1";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                        Height = 20;
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
					}	
				};
				ui.Text:new
				{
					Width = 30;
				};
				}
				};
				ui.Group:new
                                {
                                Children =
                                {
                                ui.Text:new
                                {
                                        Width = 30;
                                };
				ui.Group:new
                                {
                                        Orientation = "horizontal";
					Weight = 0x5000;
					Style = "border-width: 0; background-color:black";
                                        Children =
                                        {
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
                                                        --Height = "free";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "4";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "A2";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        --Weight = 0xF000;
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        --Height = "free";
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
                                                        --Height = "free";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "5";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "B2";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
								{
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "6";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "A3";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
											Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        --Weight = 0xF000;
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        --Height = "free";
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
                                        }
                                };
				ui.Text:new
                                {
                                        Width = 30;
                                }
				}
                                };
				ui.Group:new
                                {
                                Children =
                                {
                                ui.Text:new
                                {
                                        Width = 30;
                                };
				ui.Group:new
                                {
                                        Orientation = "horizontal";
					Weight = 0x5000;
					Style = "border-width: 0; background-color:black";
                                        Children =
                                        {
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
                                                        --Height = "free";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "7";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "B3";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
                                                        --Height = "free";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "8";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "A4";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
											Height = 20;
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
						ui.Group:new
                                                {
                                                        Orientation = "horizontal";
							Height = 202;
							Style = "border-width: 0; background-color:black";
                                                        Children =
                                                        {
								ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
                                                                        Style = "border-width: 0; background-color:black";
                                                                        Width = 20;
                                                                        Height = 60;
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; border-width: 0";
                                                                                        Text = "9";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "B4";
                                                                                };
										ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "background-color:black; border-width: 0";
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Height = 20;
                                                                                        Width = 20;
                                                                                        Style = "font: ui-large; color: #ffffff; background-color:black; border-width: 0";
                                                                                        Text = "C";
                                                                                };
                                                                        }
                                                                };
                                                                ui.Group:new
                                                                {
                                                                        Orientation = "vertical";
									Style = "border-width: 0; background-color:black";
                                                                        Children =
                                                                        {
                                                                                ui.Text:new
                                                                                {
											Style = "border-width: 0; background-color:black; color: #ffffff";
                                                                                        Height = 20;
                                                                                };
                                                                                ui.Text:new
                                                                                {
                                                                                        Style = "background-color:black";
                                                                                        Height = 182;
                                                                                        Text = "1";
                                                                                };
                                                                        }
                                                                };
                                                        }
                                                };
                                        }
                                },
				ui.Text:new
                                {
                                        Width = 30;
                                }
                                }
                                };
				ui.Group:new
                                {
                                        Orientation = "horizontal";
                                        Status = "hide";
                                        Children =
                                        {
                                                ui.Text:new
                                                {
							Style = "text-align: center;background-color: #000000; color: #ffffff; font: ui-large";
                                                };
                                                ui.Text:new
                                                {
                                                        Id = "3x3_id_station1";
                                                        Style = "text-align: center;background-color: #000000; color: #ffffff; font: ui-large";
                                                        Text = station;
                                                };
                                                ui.Text:new
                                                {
                                                        Id = "3x3_id_WiFi_st1";
                                                        Style = "text-align: right; background-color: #000000; color: #ffffff; font: ui-large";
                                                        Text = wi_fi_status;
                                                        Width = 100;
                                                };
                                                ui.Text:new
                                                {
							Style = "text-align: center;background-color: #000000; color: #ffffff; font: ui-large";
                                                };
                                        }
                                },
			},
		}
	}

}
metro.set_app(app);
playfb_3x3();

video_1x1:addNotify("Status", "hide", {ui.NOTIFY_ID, "id_1x1", ui.NOTIFY_FUNCTION,
function(self)
        os.execute("pkill playfb");
end});

video_2x2:addNotify("Status", "show", {ui.NOTIFY_ID, "2x2_id_station", "setValue", "Text", station});
video_2x2:addNotify("Status", "show", {ui.NOTIFY_ID, "2x2_id_WiFi_st", "setValue", "Text", wi_fi_status});
video_2x3:addNotify("Status", "show", {ui.NOTIFY_ID, "2x3_id_station", "setValue", "Text", station});
video_2x3:addNotify("Status", "show", {ui.NOTIFY_ID, "2x3_id_WiFi_st", "setValue", "Text", wi_fi_status});
video_3x3:addNotify("Status", "show", {ui.NOTIFY_ID, "3x3_id_station", "setValue", "Text", station});
video_3x3:addNotify("Status", "show", {ui.NOTIFY_ID, "3x3_id_WiFi_st", "setValue", "Text", wi_fi_status});
scheme:addNotify("Status", "show", {ui.NOTIFY_ID, "schema_id_station", "setValue", "Text", station});
scheme:addNotify("Status", "show", {ui.NOTIFY_ID, "schema_id_WiFi_st", "setValue", "Text", wi_fi_status});

screen_sets:addNotify("Status", "show", {ui.NOTIFY_ID, "scr_set_id_station", "setValue", "Text", station});
screen_sets:addNotify("Status", "show", {ui.NOTIFY_ID, "scr_set_id_WiFi_st", "setValue", "Text", wi_fi_status});
screen_sets:addNotify("Status", "show",{ui.NOTIFY_ID, "id_scr_set", ui.NOTIFY_FUNCTION, 
function(self)
	self:getById("bright"):activate("focus");
end});

pass:addNotify("Status", "show",{ui.NOTIFY_ID, "id_pass", ui.NOTIFY_FUNCTION,
function(self)
        self:getById("id-pass"):activate("focus");
end});

ui.Application.connect(BK_Sets);
ui.Application.connect(scheme);
ui.Application.connect(videoreg);
ui.Application.connect(ip_camera);
ui.Application.connect(video_1x1);
ui.Application.connect(video_2x2);
ui.Application.connect(video_2x3);
ui.Application.connect(screen_sets);
ui.Application.connect(video_3x3);
ui.Application.connect(pass);

app:addMember(scheme);
app:addMember(BK_Sets);
app:addMember(videoreg);
app:addMember(ip_camera);
app:addMember(video_1x1);
app:addMember(video_2x2);
app:addMember(video_2x3);
app:addMember(screen_sets);
app:addMember(video_3x3);
app:addMember(pass);

app:run()
app:hide()
app:cleanup()
