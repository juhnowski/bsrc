Model = require 'modules.models.model'
Camera = require 'modules.models.camera'
Config = require 'modules.config'

local Stream = {_space = 'streams', _plain={'camera','name'}}
Stream.__index = Stream

setmetatable(Stream, {
  __index = Model
})

function Stream:onsave()
  if self.id == '' then
    self.id = '/' .. self.data.camera .. '/archive'
  end
  if not self.data.stream_type then
    self.data.stream_type = 'live'
  end
  if not self.data.channel then
    local cam = Camera:load(self.data.camera)
    self.data.channel = cam.data.channel
  end
  if not self.data.substream then
    self.data.substream = 0
  end
  if not self.data.name then
    self.data.name = ''
  end
end

function Stream:find_ports()
  -- never find ports
  return
  if self.data.ports_reserved then
    return
  end
  local a = Stream:all()
  local used = {100000}
  local port_names = {'port','webm_port'}
  for _,s in pairs(a) do
	print('===================');
	print(s.data['port']);
    if s.data.source_online or s.data.ports_reserved then
	print('+++++++++++++++++++++');
	--print('source_online: ' .. s.data.source_online .. '  ports_reserved:' .. s.data.ports_reserved);
      for _,p in pairs(port_names) do
        if s.data[p] >= Config.OrbitaX.gst_min_port then
	print('INSERT IN TABLE');
          table.insert(used,s.data[p])
        end
      end
    end
  end
	print('SORT TABLE');
	for _,v in pairs(used) do
		print('port =' .. v);
	end
  table.sort(used)
  local p = Config.OrbitaX.gst_min_port-1
  for _,pn in pairs(port_names) do
    for _,u in pairs(used) do
      if u > p+1 then
        self.data[pn] = p+1
        if pn == 'port' then
          self.data.name = 'STREAM-' .. (p+1)
	print(self.data.port);
        end
        table.insert(used,p+1)
        table.sort(used)
        p=p+1
        break
      else
        p=u
      end
    end
  end
  --[[for _,key in pairs(used) do
    print(key);
  end]]
  self.data.ports_reserved = true
  self.data.ports_reserve_time = os.time()
  self:save()
end

return Stream
