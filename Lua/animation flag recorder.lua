local pre_anim, cur_anim;
while true do
	cur_anim = memory.readbyte(0x03001899)
	if cur_anim ~= pre_anim then
		pre_anim = cur_anim
		console.writeline(cur_anim)
	end
	emu.frameadvance()
end