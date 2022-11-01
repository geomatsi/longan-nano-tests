MEMORY
{
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 128K
	RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 32K
}

SECTIONS
{
	.text : {
		*(.init);
		*(.text);
	} >FLASH AT>FLASH

	.rodata : {
		*(.rodata);
	} >FLASH AT>FLASH

	.lalign : {
		_data_lma = .;
	} >FLASH AT>FLASH

	.dalign : {
		_sdata = .;
	} >RAM AT>FLASH

	.data : {
		*(.data);
		*(.sdata);
		_edata = .;
	} >RAM AT>FLASH

	.bss (NOLOAD) : {
		_sbss = .;
		*(.bss);
		_ebss = .;
	} >RAM AT>RAM

	PROVIDE(__stack_top = ORIGIN(RAM) + LENGTH(RAM));
}
