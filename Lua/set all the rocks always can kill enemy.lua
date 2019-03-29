local i, tmpEntityNum;
while true do
	if memory.readbyte(0x03000964) == 255 or memory.readbyte(0x03000964) == 0 then
		gui.text(16,0,"Running", 0xFFFF0000, topleft)
	else
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
			if entityid == 21 then -- if this entity is a rock, perhaps I should add gem bubble into the if-statement
				memory.write_u8(0x03000105 + i * 0x2C, 1)
				end
			i = i + 1
		end
	end
	emu.frameadvance()
end