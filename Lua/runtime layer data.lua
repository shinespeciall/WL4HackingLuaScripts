local layer1Width, layer1Height, layer1DataAddr;
local i, j;

i = 0;
j = 9;
layer1DataAddr = memory.read_u32_le(0x0300005C);
layer1Width = memory.read_u16_le(0x03000060);
layer1Height = memory.read_u16_le(0x03000062);
while true do
	console.write(bizstring.hex(memory.read_u16_le(layer1DataAddr + 2 * i + 2 * j * layer1Width)));
	console.write(" ");
	i = i + 1;
	if i == layer1Width then
		j = j + 1;
		i = 0;
		console.write('\n')
	end
	if j == layer1Height then break end
end
console.writeline(layer1DataAddr);
emu.frameadvance();