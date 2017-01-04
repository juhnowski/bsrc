socket = require 'socket'
json = require 'json'
--[[
-- log = require 'log'
socket = require 'socket'

Stream = require 'modules.models.stream'
Camera = require 'modules.models.camera'
Device = require 'modules.models.device'
DevQuery =	 require 'modules.models.devquery'
Config = require('modules.config')

]]

Config = {
  OrbitaX = {
    msg_server_port = 5556,
    gst_server_port = 5557,
    rtsp_server_port = 8554,
    webm_server_port = 8555, -- не используется пока!
    http_server_port = 8888,
    video_server_port = 8889,
    gst_min_port = 9000,
    stream_alive_seconds = 5,
    client_alive_seconds = 30,
    stream_wait_seconds = 60,
    --server_ip = '0.0.0.0',
    server_ip = '192.168.1.17',
    GUID_ORBITAX = '111-1-1',
    CAMERA_ID_IS_INT = true,
    ARCHIVE_FILES_PATH = '/root/tarantool_sandbox/video'
  }
}


function split(s, delimiter)
  local result={}
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match)
  end
  return result
end

socket.tcp_server('0.0.0.0', Config.OrbitaX.gst_server_port, function(s)
  local request = s:read('\x00')
  request = request:sub(1,-2) -- cut \x00
  --log.info("(gst) received: " .. request)
  print('request:' .. request)

  local data = json.decode(request)
  local response

  if data.cmd == 'config' then
    response = "config"
      --response = {value = Config.OrbitaX[data.param]}
  elseif data.cmd == 'setport' then
    response = "setport"
    --[[
    local url = data.stream
    local str = Stream:load(url)

    if not str.data.camera then
      -- create device
      local d = split(url, '/')

      local dev = Device:load(d[2])
      if not dev.data.device_type then
        dev.data.device_type = 'N9M'
      end
      dev.data.channels_count = 10
      dev:save()
      -- end of create device
    end

    str = Stream:load(url)
    str.data.port = data.port
    str:save()

    response = {ok = 1 }
    ]]
  elseif data.cmd == 'getport' then
    response = 'getport'
--[[
    local url = data.stream
    local str = Stream:load(url)
]]
--[[print('/0060003D6B/1/main');
print('str.id: '.. str.id);
print('Height = ' .. str.data.height);
print('Width = ' .. str.data.width);
local str2 = Stream:load('/0060003D6B/2/main');
local cam2 = Camera:load(str2.data.camera);
print('cam2.device: '.. cam2.data.device);
print('/0060003D6B/2/main');
print('Height = ' .. str2.data.height);
print('Width = ' .. str2.data.width);
local str3 = Stream:load('/0060003D6B/3/main');
local cam3 = Camera:load(str3.data.camera);
print('cam3.device: '.. cam3.data.device);
print('/0060003D6B/3/main');
print('Height = ' .. str3.data.height);
print('Width = ' .. str3.data.width);
local str4 = Stream:load('/0060003D6B/4/main');
local cam4 = Camera:load(str4.data.camera);
print('cam4.device: '.. cam4.data.device);
print('/0060003D6B/4/main');
print('Height = ' .. str4.data.height);
print('Width = ' .. str4.data.width);]]
--[[
    if not str.data.camera then
	--print("=============NO STREAM=============");
      response = { error = 'no stream' }
    else
      local cam = Camera:load(str.data.camera)
      local dev = Device:load(cam.data.device)
	print(cam.data.device);

      if dev.data.device_type == 'IPCAM' then
        response = {type = 'RTSP', uri = str.data.uri }
      else
        response = {type = 'N9M'}
	--print("=============TYPE N9M===================");
        if str.data.width then
          response.width = str.data.width
        end
        if str.data.height then

          response.height = str.data.height
        end
	print('cam.channel: ' .. cam.data.device);	
        if not str.data.source_online then
	  --print("========SOURCE OFFLINE==========");
          str:find_ports()
		  str:save()
		print('str.id = '.. str.id);
	print("===========QUERY================");
          local q = DevQuery:new(nil,{device=cam.data.device,stream=str.id,query='live_video'})--очередь запросов к видеорегистратору
		--local q = DevQuery:new(nil,{device=cam.data.device,stream=str.id,query='download'})
          q:insert()
        else
	print("===========SOURCE ONLINE===============");
          str.data.last_client_query = os.time()
          str.data.client_online = true
          str:save()
        end
        response.port = str.data.port
	--response.port = 9002;
        response.source_online = str.data.source_online and 1 or 0
      end
    end
    ]]
  elseif data.cmd == 'status' then
    response = 'status'
    --[[
    local url = data.stream
    local str = Stream:load(url)
    local cam = Camera:load(str.data.camera)
    local dev = Device:load(cam.data.device)

    if dev.data.device_type == 'IPCAM' then
      str.data.last_source_data = os.time()
      str.data.source_online = true
    end

    response = { source_online = str.data.source_online and 1 or 0 }

    if not str.data.source_online then
      local q = DevQuery:new(nil,{device=cam.data.device,stream=str.id,query='live_video'})
      q:insert()
    else
      if data.size and data.size[1] then
        str.data.width = data.size[1]
        str.data.height = data.size[2]
      end
      str.data.last_client_query = os.time()
      str.data.client_online = true
      str:save()
    end
    ]]

  end
  --[[
  response = json.encode(response)
  log.info("(gst) response: " .. response)
  s:write(response .. '\x00')
  ]]
end)
