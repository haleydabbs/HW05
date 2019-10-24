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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #48
	ldr	r4, .L4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+8
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startTiles
	.word	100679680
	.word	startMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #2048
	mov	r2, #4352
	push	{r4, lr}
	mov	r0, #3
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r4, .L8
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L8+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	startPal
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
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
	push	{r4, lr}
	mov	r3, #48
	ldr	r4, .L16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+8
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	gameTiles
	.word	100679680
	.word	gameMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	start.part.0, %function
start.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L23+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L24:
	.align	2
.L23:
	.word	buttons
	.word	initGame
	.size	start.part.0, .-start.part.0
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
	@ link register save eliminated.
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	start.part.0
.L28:
	.align	2
.L27:
	.word	oldButtons
	.size	start, .-start
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
	push	{r4, lr}
	mov	r3, #48
	ldr	r4, .L31
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L31+8
	mov	r0, #3
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L31+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L32:
	.align	2
.L31:
	.word	DMANow
	.word	pauseTiles
	.word	100679680
	.word	pauseMap
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
	ldr	r3, .L38
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	buttons
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
	push	{r4, lr}
	mov	r3, #48
	ldr	r4, .L42
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L42+8
	mov	r0, #3
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L42+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	DMANow
	.word	winTiles
	.word	100679680
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
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L47:
	.align	2
.L46:
	.word	oldButtons
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
	push	{r4, lr}
	mov	r3, #48
	ldr	r4, .L50
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L50+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L50+8
	mov	r0, #3
	ldr	r1, .L50+12
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L50+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	DMANow
	.word	loseTiles
	.word	100679680
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
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+8
	ldr	r3, .L69+12
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L69+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L66
.L53:
	tst	r3, #1
	beq	.L54
	ldr	r2, .L69+24
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L67
.L54:
	tst	r3, #2
	beq	.L52
	ldr	r3, .L69+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L68
.L52:
	pop	{r4, lr}
	bx	lr
.L66:
	pop	{r4, lr}
	b	goToPause
.L67:
	pop	{r4, lr}
	b	goToWin
.L68:
	pop	{r4, lr}
	b	goToLose
.L70:
	.align	2
.L69:
	.word	updateGame
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
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
	ldr	r10, .L89
	ldr	r4, .L89+4
	ldr	r3, .L89+8
	mov	lr, pc
	bx	r3
	ldr	r9, .L89+12
	ldr	r0, [r4]
	ldrh	r2, [r10]
	ldr	r8, .L89+16
	ldr	r5, .L89+20
	ldr	r7, .L89+24
	ldr	r6, .L89+28
	ldr	fp, .L89+32
.L73:
	strh	r2, [r9]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r10]	@ movhi
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L81
.L75:
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
.L74:
	tst	r2, #8
	beq	.L81
	mov	lr, pc
	bx	r6
	ldr	r0, [r4]
	ldrh	r2, [r10]
	b	.L73
.L76:
	tst	r2, #8
	beq	.L81
	mov	lr, pc
	bx	r7
	ldr	r0, [r4]
	ldrh	r2, [r10]
	b	.L73
.L77:
	tst	r2, #8
	beq	.L81
	tst	r3, #8
	beq	.L88
.L81:
	mov	r2, r3
	b	.L73
.L79:
	tst	r2, #8
	beq	.L81
	mov	lr, pc
	bx	r8
	ldr	r0, [r4]
	ldrh	r2, [r10]
	b	.L73
.L78:
	mov	lr, pc
	bx	r5
	ldr	r0, [r4]
	ldrh	r2, [r10]
	b	.L73
.L88:
	ldr	r3, .L89+36
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldrh	r2, [r10]
	b	.L73
.L90:
	.align	2
.L89:
	.word	buttons
	.word	state
	.word	initialize
	.word	oldButtons
	.word	start.part.0
	.word	game
	.word	win.part.0
	.word	lose.part.0
	.word	67109120
	.word	goToGame
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
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
