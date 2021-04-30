local i, tmpEntityNum;
while true do
	if memory.readbyte(0x03000964) == 255 or memory.readbyte(0x03000964) == 0 then
		gui.text(16,0,"Running", 0xFFFF0000, topleft)
	else
		-- gui.text(16,0,"Proceeding", 0xFFFF0000, topleft)
		tmpEntityNum = 0
		i = 0
		for i=0, 64, 1 do
			if memory.readbyte(0x03000964 + 3 * i) == 255 then
				break
			end
			tmpEntityNum = tmpEntityNum + 1
		end
		i = 0
		while(i < tmpEntityNum) do
			local entityid = memory.readbyte(0x0300011b + i * 0x2C)
			local entitystat = memory.read_u16_le(0x03000104 + i * 0x2C)
			local entitypadding = memory.readbyte(0x0300012b + i * 0x2C)
			local entityTWork0 = memory.readbyte(0x0300012c + i * 0x2C)
			local entityTWork1 = memory.readbyte(0x0300012d + i * 0x2C)
			local entityTWork2 = memory.readbyte(0x0300012e + i * 0x2C)
			local entityTWork3 = memory.readbyte(0x0300012f + i * 0x2C)
			gui.text(0, 16 * i, tostring(entityid), 0xFFFF0000, topleft)
			gui.text(30, 16 * i, tostring(bizstring.hex(entitystat)), 0xFFFF0000, topleft)
			gui.text(90, 16 * i, tostring(bizstring.hex(entitypadding)), 0xFFFF0000, topleft)
			gui.text(120, 16 * i, tostring(bizstring.hex(entityTWork0)), 0xFFFF0000, topleft)
			gui.text(150, 16 * i, tostring(bizstring.hex(entityTWork1)), 0xFFFF0000, topleft)
			gui.text(180, 16 * i, tostring(bizstring.hex(entityTWork2)), 0xFFFF0000, topleft)
			gui.text(210, 16 * i, tostring(bizstring.hex(entityTWork3)), 0xFFFF0000, topleft)
			i=i+1
		end
	end
	emu.frameadvance()
end