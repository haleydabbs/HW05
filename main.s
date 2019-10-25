	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #1536
	mov	r4, #67108864
	ldr	r5, .L4
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #48
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+16
	mov	r3, #48
	strh	r2, [r4, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+36
	mov	r3, #752
	strh	r2, [r4, #12]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+48
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r5
	mov	r2, #4096
	ldr	r3, .L4+56
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #14]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L4+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #0
	ldrh	r3, [r4]
	ldr	r2, .L4+64
	orr	r3, r3, #256
	strh	r3, [r4]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startTiles
	.word	100675584
	.word	startMap
	.word	3588
	.word	100679680
	.word	gameTiles
	.word	100691968
	.word	gameMap
	.word	5640
	.word	100696064
	.word	pauseTiles
	.word	100708352
	.word	pauseMap
	.word	7692
	.word	startPal
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r0, #0
	ldrh	r3, [r2]
	ldr	r1, .L7
	orr	r3, r3, #256
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L8:
	.align	2
.L7:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	ldr	r2, .L18+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #256
	strh	r3, [r4]	@ movhi
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldrh	r3, [r4]
	ldr	r2, .L18+20
	orr	r3, r3, #4608
	strh	r3, [r4]	@ movhi
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r0, #1
	ldrh	r3, [r2]
	ldr	r1, .L21
	orr	r3, r3, #4608
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L22:
	.align	2
.L21:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r0, #2
	ldrh	r3, [r2]
	ldr	r1, .L24
	bic	r3, r3, #4096
	orr	r3, r3, #1024
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L31
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r2, #67108864
	mov	r0, #1
	ldrh	r3, [r2]
	ldr	r1, .L31+8
	bic	r3, r3, #1024
	orr	r3, r3, #4608
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L32:
	.align	2
.L31:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #2048
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L35
	mov	r3, #880
	ldr	r2, .L35+4
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L35+12
	mov	r0, #3
	ldr	r1, .L35+16
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L35+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	DMANow
	.word	100712448
	.word	winTiles
	.word	100724736
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	mov	r1, #67108864
	ldrh	r2, [r1]
	ldr	r0, .L42+8
	bic	r2, r2, #2048
	orr	r2, r2, #256
	strh	r2, [r1]	@ movhi
	str	r3, [r0]
	bx	lr
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #2048
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L46
	mov	r3, #784
	ldr	r2, .L46+4
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L46+12
	mov	r0, #3
	ldr	r1, .L46+16
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L46+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	DMANow
	.word	100712448
	.word	loseTiles
	.word	100724736
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L59
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L59+8
	ldr	r3, .L59+12
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L59+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L59+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L49:
	ldr	r3, .L59+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L57
	ldr	r3, .L59+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L58
	pop	{r4, lr}
	bx	lr
.L56:
	mov	r2, #67108864
	mov	r0, #2
	ldrh	r3, [r2]
	ldr	r1, .L59+36
	bic	r3, r3, #4608
	orr	r3, r3, #1024
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L57:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToWin
.L58:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToLose
.L60:
	.align	2
.L59:
	.word	updateGame
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	eRemaining
	.word	livesRemaining
	.word	state
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	ldr	r6, .L72+4
	ldr	fp, .L72+8
	ldr	r5, .L72+12
	ldr	r10, .L72+16
	ldr	r9, .L72+20
	ldr	r8, .L72+24
	ldr	r7, .L72+28
	ldr	r4, .L72+32
.L62:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L63:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L63
.L65:
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L64
	.word	.L64
.L64:
	mov	lr, pc
	bx	r7
	b	.L62
.L66:
	mov	lr, pc
	bx	r8
	b	.L62
.L67:
	mov	lr, pc
	bx	r9
	b	.L62
.L68:
	mov	lr, pc
	bx	r10
	b	.L62
.L73:
	.align	2
.L72:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	eBulletTimer,4,4
	.comm	randomChanceforDrop,4,4
	.comm	randomEnemy,4,4
	.comm	livesRemaining,4,4
	.comm	ebullets,196,4
	.comm	bullets,140,4
	.comm	enemies,600,4
	.comm	eRemaining,4,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
