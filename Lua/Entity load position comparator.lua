local i, tmpEntityNum;
while true do
	if memory.readbyte(0x03000964) == 255 then
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
			local entityx = memory.readbyte(0x0300010e + i * 0x2C) + 255 * memory.readbyte(0x0300010f + i * 0x2C)
			local entityy = memory.readbyte(0x0300010c + i * 0x2C) + 255 * memory.readbyte(0x0300010d + i * 0x2C)
			local entitysourcex = memory.readbyte(0x03000964 + i * 3 + 1) * 64
			local entitysourcey = memory.readbyte(0x03000964 + i * 3) * 64
			gui.text(0, 16 * i, tostring(entityid), 0xFFFF0000, topleft)
			gui.text(20, 16 * i, tostring(entityx - entitysourcex), 0xFFFF0000, topleft)
			gui.text(68, 16 * i, tostring(entityy - entitysourcey), 0xFFFF0000, topleft)
			i=i+1
		end
	end
	emu.frameadvance()
end