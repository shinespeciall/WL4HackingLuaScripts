while true do
	if memory.readbyte(0x03001899) > 20 then -- memory.readbyte(0x030018B0) == 0 and 
		console.writeline(memory.readbyte(0x03001899))
	end
	emu.frameadvance()
end