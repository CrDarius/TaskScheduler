	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	current_task
	.bss
	.align	2
	.type	current_task, %object
	.size	current_task, 4
current_task:
	.space	4
	.global	global_tick_count
	.align	2
	.type	global_tick_count, %object
	.size	global_tick_count, 4
global_tick_count:
	.space	4
	.global	ICSR
	.section	.rodata
	.align	2
	.type	ICSR, %object
	.size	ICSR, 4
ICSR:
	.word	-536810236
	.global	tasks
	.bss
	.align	2
	.type	tasks, %object
	.size	tasks, 80
tasks:
	.space	80
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	enable_handlers
	ldr	r0, .L3
	bl	init_scheduler_stack
	bl	init_tasks
	bl	init_tasks_psp
	bl	Init_SysTick_Timer
	bl	change_sp_to_psp
	bl	Task_Idle
.L2:
	b	.L2
.L4:
	.align	2
.L3:
	.word	536964096
	.size	main, .-main
	.align	1
	.global	enable_handlers
	.syntax unified
	.thumb
	.thumb_func
	.type	enable_handlers, %function
enable_handlers:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L6
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #458752
	ldr	r3, [r7, #4]
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L7:
	.align	2
.L6:
	.word	-536810204
	.size	enable_handlers, .-enable_handlers
	.align	1
	.global	init_scheduler_stack
	.syntax unified
	.thumb
	.thumb_func
	.type	init_scheduler_stack, %function
init_scheduler_stack:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.syntax unified
@ 58 "main.c" 1
	MSR MSP, R0
@ 0 "" 2
@ 59 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	.size	init_scheduler_stack, .-init_scheduler_stack
	.align	1
	.global	init_tasks
	.syntax unified
	.thumb
	.thumb_func
	.type	init_tasks, %function
init_tasks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L10
	ldr	r2, .L10+4
	str	r2, [r3]
	ldr	r3, .L10
	ldr	r2, .L10+8
	str	r2, [r3, #16]
	ldr	r3, .L10
	ldr	r2, .L10+12
	str	r2, [r3, #32]
	ldr	r3, .L10
	ldr	r2, .L10+16
	str	r2, [r3, #48]
	ldr	r3, .L10
	ldr	r2, .L10+20
	str	r2, [r3, #64]
	ldr	r3, .L10
	ldr	r2, .L10+24
	str	r2, [r3, #4]
	ldr	r3, .L10
	ldr	r2, .L10+28
	str	r2, [r3, #20]
	ldr	r3, .L10
	ldr	r2, .L10+32
	str	r2, [r3, #36]
	ldr	r3, .L10
	ldr	r2, .L10+36
	str	r2, [r3, #52]
	ldr	r3, .L10
	ldr	r2, .L10+40
	str	r2, [r3, #68]
	ldr	r3, .L10
	movs	r2, #255
	strb	r2, [r3, #12]
	ldr	r3, .L10
	movs	r2, #255
	strb	r2, [r3, #28]
	ldr	r3, .L10
	movs	r2, #255
	strb	r2, [r3, #44]
	ldr	r3, .L10
	movs	r2, #255
	strb	r2, [r3, #60]
	ldr	r3, .L10
	movs	r2, #255
	strb	r2, [r3, #76]
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L11:
	.align	2
.L10:
	.word	tasks
	.word	536969216
	.word	536968192
	.word	536967168
	.word	536966144
	.word	536965120
	.word	Task_Idle
	.word	Task_1_Handler
	.word	Task_2_Handler
	.word	Task_3_Handler
	.word	Task_4_Handler
	.size	init_tasks, .-init_tasks
	.align	1
	.global	init_tasks_psp
	.syntax unified
	.thumb
	.thumb_func
	.type	init_tasks_psp, %function
init_tasks_psp:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L13
.L14:
	ldr	r2, .L15
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r3, [r3]
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	mov	r2, #16777216
	str	r2, [r3]
	ldr	r3, [r7]
	subs	r3, r3, #4
	str	r3, [r7]
	ldr	r2, .L15
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #4
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7]
	str	r2, [r3]
	ldr	r3, [r7]
	subs	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	mvn	r2, #2
	str	r2, [r3]
	ldr	r3, [r7]
	subs	r3, r3, #52
	str	r3, [r7]
	ldr	r2, [r7]
	ldr	r1, .L15
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r1
	str	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L13:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L14
	nop
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L16:
	.align	2
.L15:
	.word	tasks
	.size	init_tasks_psp, .-init_tasks_psp
	.align	1
	.global	Init_SysTick_Timer
	.syntax unified
	.thumb
	.thumb_func
	.type	Init_SysTick_Timer, %function
Init_SysTick_Timer:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	ldr	r3, .L18
	str	r3, [r7, #12]
	ldr	r3, .L18+4
	str	r3, [r7, #8]
	ldr	r3, .L18+8
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #4
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L19:
	.align	2
.L18:
	.word	90111
	.word	-536813548
	.word	-536813552
	.size	Init_SysTick_Timer, .-Init_SysTick_Timer
	.align	1
	.global	change_sp_to_psp
	.syntax unified
	.thumb
	.thumb_func
	.type	change_sp_to_psp, %function
change_sp_to_psp:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	ldr	r3, .L21
	ldr	r3, [r3]
	ldr	r2, .L21+4
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r3, [r3]
	.syntax unified
@ 130 "main.c" 1
	MSR PSP, r3
@ 0 "" 2
@ 132 "main.c" 1
	MOV R0, #0x02
@ 0 "" 2
@ 133 "main.c" 1
	MSR CONTROL, R0
@ 0 "" 2
@ 135 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
.L22:
	.align	2
.L21:
	.word	current_task
	.word	tasks
	.size	change_sp_to_psp, .-change_sp_to_psp
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	interrupt_disable, %function
interrupt_disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	.syntax unified
@ 140 "main.c" 1
	MOV R0, #0x01
@ 0 "" 2
@ 141 "main.c" 1
	MSR PRIMASK, R0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	interrupt_disable, .-interrupt_disable
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	interrupt_enable, %function
interrupt_enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	.syntax unified
@ 146 "main.c" 1
	MOV R0, #0x00
@ 0 "" 2
@ 147 "main.c" 1
	MSR PRIMASK, R0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	interrupt_enable, .-interrupt_enable
	.align	1
	.global	delay_task
	.syntax unified
	.thumb
	.thumb_func
	.type	delay_task, %function
delay_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	bl	interrupt_disable
	.syntax unified
@ 153 "main.c" 1
	MOV R0, #0x01
@ 0 "" 2
@ 154 "main.c" 1
	MSR PRIMASK, R0
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L26
	ldr	r1, [r3]
	ldr	r3, .L26+4
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	add	r2, r2, r1
	ldr	r1, .L26+8
	lsls	r3, r3, #4
	add	r3, r3, r1
	adds	r3, r3, #8
	str	r2, [r3]
	ldr	r3, .L26+4
	ldr	r3, [r3]
	ldr	r2, .L26+8
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #12
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, .L26+12
	ldr	r3, [r3]
	ldr	r2, .L26+12
	orr	r3, r3, #268435456
	str	r3, [r2]
	bl	interrupt_enable
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L27:
	.align	2
.L26:
	.word	global_tick_count
	.word	current_task
	.word	tasks
	.word	-536810236
	.size	delay_task, .-delay_task
	.align	1
	.global	Task_Idle
	.syntax unified
	.thumb
	.thumb_func
	.type	Task_Idle, %function
Task_Idle:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L29:
	b	.L29
	.size	Task_Idle, .-Task_Idle
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Task 1 executing\000"
	.text
	.align	1
	.global	Task_1_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Task_1_Handler, %function
Task_1_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L31:
	ldr	r0, .L32
	bl	puts
	mov	r0, #1000
	bl	delay_task
	b	.L31
.L33:
	.align	2
.L32:
	.word	.LC0
	.size	Task_1_Handler, .-Task_1_Handler
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Task 2 executing\000"
	.text
	.align	1
	.global	Task_2_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Task_2_Handler, %function
Task_2_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L35:
	ldr	r0, .L36
	bl	puts
	mov	r0, #500
	bl	delay_task
	b	.L35
.L37:
	.align	2
.L36:
	.word	.LC1
	.size	Task_2_Handler, .-Task_2_Handler
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Task 3 executing\000"
	.text
	.align	1
	.global	Task_3_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Task_3_Handler, %function
Task_3_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L39:
	ldr	r0, .L40
	bl	puts
	movs	r0, #250
	bl	delay_task
	b	.L39
.L41:
	.align	2
.L40:
	.word	.LC2
	.size	Task_3_Handler, .-Task_3_Handler
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Task 4 executing\000"
	.text
	.align	1
	.global	Task_4_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	Task_4_Handler, %function
Task_4_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L43:
	ldr	r0, .L44
	bl	puts
	movs	r0, #125
	bl	delay_task
	b	.L43
.L45:
	.align	2
.L44:
	.word	.LC3
	.size	Task_4_Handler, .-Task_4_Handler
	.align	1
	.global	switch_task
	.syntax unified
	.thumb
	.thumb_func
	.type	switch_task, %function
switch_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7]
	b	.L47
.L50:
	ldr	r3, .L54
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L54
	str	r3, [r2]
	ldr	r3, .L54
	ldr	r1, [r3]
	ldr	r3, .L54+4
	umull	r2, r3, r3, r1
	lsrs	r2, r3, #2
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	subs	r2, r1, r3
	ldr	r3, .L54
	str	r2, [r3]
	ldr	r3, .L54
	ldr	r3, [r3]
	ldr	r2, .L54+8
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #12
	ldrb	r3, [r3]
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L48
	ldr	r3, .L54
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L52
.L48:
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L47:
	ldr	r3, [r7]
	cmp	r3, #4
	ble	.L50
	b	.L49
.L52:
	nop
.L49:
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L53
	ldr	r3, .L54
	movs	r2, #0
	str	r2, [r3]
.L53:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L55:
	.align	2
.L54:
	.word	current_task
	.word	-858993459
	.word	tasks
	.size	switch_task, .-switch_task
	.align	1
	.global	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.syntax unified
@ 229 "main.c" 1
	MRS R0, PSP
@ 0 "" 2
@ 231 "main.c" 1
	STMDB R0!, {R4-R11}
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L57
	ldr	r3, [r3]
	.syntax unified
@ 233 "main.c" 1
	MOV r2, R0
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L57+4
	lsls	r3, r3, #4
	add	r3, r3, r1
	str	r2, [r3]
	.syntax unified
@ 236 "main.c" 1
	PUSH {LR}
@ 0 "" 2
	.thumb
	.syntax unified
	bl	switch_task
	.syntax unified
@ 239 "main.c" 1
	POP {LR}
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L57
	ldr	r3, [r3]
	ldr	r2, .L57+4
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r3, [r3]
	.syntax unified
@ 241 "main.c" 1
	MOV R0,r3
@ 0 "" 2
@ 243 "main.c" 1
	LDMIA R0!, {R4-R11}
@ 0 "" 2
@ 245 "main.c" 1
	MSR PSP, R0
@ 0 "" 2
@ 246 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
.L58:
	.align	2
.L57:
	.word	current_task
	.word	tasks
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L63
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L63
	str	r3, [r2]
	movs	r3, #1
	str	r3, [r7, #4]
	b	.L60
.L62:
	ldr	r2, .L63+4
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L61
	ldr	r2, .L63+4
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, .L63
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L61
	ldr	r2, .L63+4
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #12
	movs	r2, #255
	strb	r2, [r3]
.L61:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L60:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L62
	ldr	r3, .L63+8
	ldr	r3, [r3]
	ldr	r2, .L63+8
	orr	r3, r3, #268435456
	str	r3, [r2]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L64:
	.align	2
.L63:
	.word	global_tick_count
	.word	tasks
	.word	-536810236
	.size	SysTick_Handler, .-SysTick_Handler
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Exception: Hardfault\000"
	.text
	.align	1
	.global	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L67
	bl	puts
.L66:
	b	.L66
.L68:
	.align	2
.L67:
	.word	.LC4
	.size	HardFault_Handler, .-HardFault_Handler
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Exception: Memfault\000"
	.text
	.align	1
	.global	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L71
	bl	puts
.L70:
	b	.L70
.L72:
	.align	2
.L71:
	.word	.LC5
	.size	MemManage_Handler, .-MemManage_Handler
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Exception: Busfault\000"
	.text
	.align	1
	.global	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L75
	bl	puts
.L74:
	b	.L74
.L76:
	.align	2
.L75:
	.word	.LC6
	.size	BusFault_Handler, .-BusFault_Handler
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Exception: UsageFault\000"
	.text
	.align	1
	.global	UsageFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	UsageFault_Handler, %function
UsageFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L79
	bl	puts
.L78:
	b	.L78
.L80:
	.align	2
.L79:
	.word	.LC7
	.size	UsageFault_Handler, .-UsageFault_Handler
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
