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
			local entityx = memory.readbyte(0x0300010e + i * 0x2C) + 255 * memory.readbyte(0x0300010f + i * 0x2C)
			local entityy = memory.readbyte(0x0300010c + i * 0x2C) + 255 * memory.readbyte(0x0300010d + i * 0x2C)
			local entitysourcex = memory.readbyte(0x03000964 + i * 3 + 1) * 64
			local entitysourcey = memory.readbyte(0x03000964 + i * 3) * 64
			local entityOAMprt = memory.readbyte(0x03000108 + i * 0x2C) + 256 * memory.readbyte(0x03000109 + i * 0x2C) + 256 * 256 * memory.readbyte(0x0300010A + i * 0x2C)
			local entityLayer = memory.readbyte(0x0300011E + i * 0x2C)
			local entityPalette = memory.readbyte(0x0300011F + i * 0x2C)
			local entityPaletteoffset = memory.readbyte(0x0300011D + i * 0x2C)
			gui.text(0, 16 * i, tostring(entityid), 0xFFFF0000, topleft)
			gui.text(30, 16 * i, tostring(entityx - entitysourcex), 0xFFFF0000, topleft)
			gui.text(68, 16 * i, tostring(entityy - entitysourcey), 0xFFFF0000, topleft)
			gui.text(120, 16 * i, tostring(entityOAMprt), 0xFFFF0000, topleft)
			gui.text(200, 16 * i, tostring(entityLayer), 0xFFFF0000, topleft)
			gui.text(240, 16 * i, tostring(entityPalette), 0xFFFF0000, topleft)
			gui.text(280, 16 * i, tostring(entityPaletteoffset), 0xFFFF0000, topleft)
			i=i+1
		end
	end
	emu.frameadvance()
end