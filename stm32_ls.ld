ENTRY(Reset_Handler)

MEMORY
{
	FLASH(rx):ORIGIN =0x08000000,LENGTH =512K
	SRAM(rwx):ORIGIN =0x20000000,LENGTH =96K
}

__max_heap_size = 0x400; /*This a symbol declaration. Not a variable!*/
__max_stack_size = 0x200; /*This is a symbol declaration. Not a variable!*/

SECTIONS
{
	.text :
	{
		*(.isr_vector)
		*(.text)
		*(.rodata)
		_end_of_text = .; /*The location counter is incremented by the size of the .text section. This means that end_of_text symbol saves the end of the text section*/
	}> FLASH

	.data :
	{
		_start_of_data = .; /*declaration of another symbol*/
		*(.data)
		_end_of_data = .;
	}> SRAM AT> FLASH

	.bss :
	{
		_start_of_bss = .;
		*(.bss)
		_end_of_bss = .;
	}>SRAM
}
