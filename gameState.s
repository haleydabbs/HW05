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
	.file	"gameState.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEBullets.part.0, %function
updateEBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r1, [r0]
	ldr	r3, [r0, #16]
	add	r2, r1, r3
	cmp	r2, #159
	mov	r4, r0
	ldr	r2, [r0, #20]
	sub	sp, sp, #20
	ble	.L9
	mov	r0, #0
	ldr	r1, .L10
	lsl	r2, r2, #3
	ldrh	r3, [r1, r2]
	orr	r3, r3, #512
	str	r0, [r4, #24]
	strh	r3, [r1, r2]	@ movhi
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L9:
	ldr	lr, .L10+4
	ldr	ip, [r0, #8]
	ldr	r7, [lr, #12]
	add	r1, r1, ip
	ldr	r0, [r0, #4]
	ldr	r5, .L10
	str	r1, [r4]
	str	r7, [sp, #12]
	add	ip, r5, r2, lsl #3
	lsl	r6, r2, #3
	ldr	r2, [lr, #8]
	str	r2, [sp, #8]
	ldr	r2, [lr, #4]
	ldr	r7, [lr]
	stm	sp, {r2, r7}
	ldr	lr, .L10+8
	strh	r1, [r5, r6]	@ movhi
	ldr	r2, [r4, #12]
	strh	r0, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	ldr	r6, .L10+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L1
	mov	ip, #0
	ldr	r3, [r4, #20]
	ldr	r0, .L10+16
	lsl	r3, r3, #3
	ldrh	r2, [r5, r3]
	ldr	r1, [r0]
	orr	r2, r2, #512
	sub	r1, r1, #1
	str	ip, [r4, #24]
	str	r1, [r0]
	strh	r2, [r5, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	shadowOAM
	.word	player
	.word	4115
	.word	collision
	.word	livesRemaining
	.size	updateEBullets.part.0, .-updateEBullets.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropBullet.part.0, %function
dropBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L22
	mov	r3, #0
	mov	r2, ip
	b	.L15
.L13:
	add	r3, r3, #1
	cmp	r3, #7
	add	r2, r2, #28
	bxeq	lr
.L15:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L13
	push	{r4, lr}
	mov	lr, #1
	ldr	r1, [r0, #16]
	ldr	r2, [r0, #4]
	ldr	r4, [r0, #20]
	add	r2, r2, r1, asr #2
	ldr	r1, [r0]
	rsb	r3, r3, r3, lsl #3
	add	r1, r1, r4, asr #2
	add	r0, ip, r3, lsl #2
	str	lr, [r0, #24]
	str	r1, [ip, r3, lsl #2]
	str	r2, [r0, #4]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	ebullets
	.size	dropBullet.part.0, .-dropBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSprites.part.0, %function
updateSprites.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #36]
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r2, r2, #1
	ldr	r3, [r0, #24]
	ldr	r1, [r0, #4]
	str	r2, [r0, #36]
	ldr	r6, .L41
	ldr	r2, [r0, #28]
	ldr	ip, [r0]
	orr	r1, r1, #16384
	orr	r2, r2, #4096
	mov	r5, r0
	lsl	r0, r3, #3
	add	r3, r6, r3, lsl #3
	strh	ip, [r6, r0]	@ movhi
	sub	sp, sp, #16
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	r0, .L41+4
	mov	lr, pc
	bx	r0
	ldr	r3, .L41+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	ldr	r1, [r5, #36]
	add	r3, r3, r3, lsl #2
	ldr	r2, .L41+12
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r1, #100
	str	r3, [r2]
	ble	.L25
	cmp	r3, #85
	bgt	.L39
.L26:
	mov	r3, #0
	str	r3, [r5, #36]
.L25:
	mov	r10, #0
	ldr	r4, .L41+16
	ldr	r8, .L41+20
	ldr	r9, .L41+24
	add	r7, r4, #140
.L30:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L40
.L28:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L30
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L40:
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L28
	mov	r0, #512
	str	r10, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r3, [r5, #24]
	ldr	r2, [r9]
	lsl	r1, r1, #3
	lsl	r3, r3, #3
	sub	r2, r2, #1
	strh	r0, [r6, r1]	@ movhi
	str	r2, [r9]
	str	r10, [r5, #32]
	strh	r0, [r6, r3]	@ movhi
	b	.L28
.L39:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L26
	mov	r0, r5
	bl	dropBullet.part.0
	b	.L26
.L42:
	.align	2
.L41:
	.word	shadowOAM
	.word	rand
	.word	1374389535
	.word	randomChanceforDrop
	.word	bullets
	.word	collision
	.word	eRemaining
	.size	updateSprites.part.0, .-updateSprites.part.0
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r3, #0
	mov	r2, #16
	str	lr, [sp, #-4]!
	cmp	r1, #4
	add	lr, r1, ip
	str	lr, [r0, #24]
	str	ip, [r0, #32]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #36]
	bgt	.L44
	mov	r2, #100
	mov	r3, #12
	lsl	r1, r1, #4
	stm	r0, {r1, r2}
	str	r3, [r0, #28]
.L43:
	ldr	lr, [sp], #4
	bx	lr
.L44:
	cmp	r1, #9
	bgt	.L46
	mov	r2, #116
	mov	r3, #14
	sub	r1, r1, #5
	lsl	r1, r1, #4
	stm	r0, {r1, r2}
	str	r3, [r0, #28]
	ldr	lr, [sp], #4
	bx	lr
.L46:
	cmp	r1, #14
	bgt	.L43
	mov	r3, #132
	sub	r1, r1, #10
	lsl	r1, r1, #4
	str	r1, [r0]
	str	r2, [r0, #28]
	str	r3, [r0, #4]
	ldr	lr, [sp], #4
	bx	lr
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #3
	mov	lr, #15
	mov	r5, #0
	ldr	r2, .L56
	ldr	r1, .L56+4
	ldr	ip, .L56+8
	str	lr, [r1]
	mov	r0, r4
	str	r4, [r2]
	mov	r3, #16384
	ldr	r2, .L56+12
	ldr	r1, .L56+16
	ldr	r6, .L56+20
	str	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r0, r4
	ldr	r2, .L56+24
	ldr	r1, .L56+28
	mov	r3, #256
	mov	lr, pc
	bx	r6
	ldr	r3, .L56+32
	mov	lr, pc
	bx	r3
	mov	r0, #120
	mov	r2, #32
	mov	ip, #104
	mov	r1, #2
	mov	r4, r5
	ldr	r3, .L56+36
	stm	r3, {r0, ip}
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r0, .L56+40
.L49:
	mov	r1, r4
	bl	initEnemy
	add	r4, r4, #1
	cmp	r4, #15
	add	r0, r0, #40
	bne	.L49
	mov	r2, #18
	mov	r0, #8
	mov	r1, #0
	mov	ip, #2
	ldr	r3, .L56+44
.L50:
	str	r2, [r3, #20]
	add	r2, r2, #1
	cmp	r2, #23
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3]
	str	ip, [r3, #8]
	str	r1, [r3, #24]
	add	r3, r3, #28
	bne	.L50
	mov	r2, #33
	mov	r0, #8
	mov	r1, #0
	mov	ip, #1
	ldr	r3, .L56+48
.L51:
	str	r2, [r3, #20]
	add	r2, r2, #1
	cmp	r2, #40
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r1, [r3]
	str	ip, [r3, #8]
	str	r1, [r3, #24]
	add	r3, r3, #28
	bne	.L51
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	livesRemaining
	.word	eRemaining
	.word	eBulletTimer
	.word	100728832
	.word	spriteSheetTiles
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	hideSprites
	.word	player
	.word	enemies
	.word	bullets
	.word	ebullets
	.size	initGame, .-initGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #8
	mov	ip, #2
	add	r1, r1, #18
	str	r1, [r0, #20]
	str	ip, [r0, #8]
	str	r2, [r0, #12]
	str	r2, [r0, #16]
	str	r3, [r0, #4]
	str	r3, [r0]
	str	r3, [r0, #24]
	bx	lr
	.size	initBullets, .-initBullets
	.align	2
	.global	initEBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEBullets, %function
initEBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #8
	mov	ip, #1
	add	r1, r1, #33
	str	r1, [r0, #20]
	str	ip, [r0, #8]
	str	r2, [r0, #12]
	str	r2, [r0, #16]
	str	r3, [r0, #4]
	str	r3, [r0]
	str	r3, [r0, #24]
	bx	lr
	.size	initEBullets, .-initEBullets
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L78
	ldr	r3, [r2, #20]
	cmp	r3, #0
	movne	r1, #0
	push	{r4, lr}
	strne	r3, [r2, #24]
	ldr	r3, .L78+4
	ldrh	r3, [r3, #48]
	strne	r1, [r2, #20]
	tst	r3, #32
	ldr	r3, [r2, #4]
	bne	.L62
	mov	r1, #2
	cmp	r3, r1
	str	r1, [r2, #20]
	ldrgt	r1, [r2, #28]
	subgt	r3, r3, r1
	strgt	r3, [r2, #4]
.L62:
	ldr	r1, .L78+4
	ldrh	r1, [r1, #48]
	tst	r1, #16
	beq	.L63
	ldr	r1, [r2, #20]
	lsl	r1, r1, #18
	lsr	r1, r1, #16
.L64:
	ldr	r0, .L78+8
	ldrh	r0, [r0]
	tst	r0, #1
	ldr	ip, [r2]
	beq	.L65
	ldr	r2, .L78+12
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L65
	ldr	r4, .L78+16
	mov	r0, r4
.L67:
	ldr	lr, [r0, #24]
	cmp	lr, #0
	beq	.L77
	add	r2, r2, #1
	cmp	r2, #5
	add	r0, r0, #28
	bne	.L67
.L65:
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L78+20
	pop	{r4, lr}
	strh	r3, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L63:
	mov	r0, #1
	ldr	r1, [r2, #8]
	add	r1, r3, r1
	cmp	r1, #239
	ldrle	r1, [r2, #28]
	addle	r3, r3, r1
	str	r0, [r2, #20]
	mov	r1, #4
	strle	r3, [r2, #4]
	b	.L64
.L77:
	mov	lr, #1
	rsb	r2, r2, r2, lsl #3
	str	ip, [r4, r2, lsl #2]
	add	r0, r3, #12
	add	r2, r4, r2, lsl #2
	str	lr, [r2, #24]
	str	r0, [r2, #4]
	b	.L65
.L79:
	.align	2
.L78:
	.word	player
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	fire
	.syntax unified
	.arm
	.fpu softvfp
	.type	fire, %function
fire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L91
	mov	r2, r0
	ldr	r1, [r2, #24]
	cmp	r1, #0
	mov	r3, #0
	beq	.L90
.L81:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L81
.L90:
	mov	ip, #1
	ldr	r1, .L91+4
	ldr	r2, [r1, #4]
	str	lr, [sp, #-4]!
	rsb	r3, r3, r3, lsl #3
	ldr	lr, [r1]
	add	r2, r2, #12
	add	r1, r0, r3, lsl #2
	str	lr, [r0, r3, lsl #2]
	str	r2, [r1, #4]
	str	ip, [r1, #24]
	ldr	lr, [sp], #4
	bx	lr
.L92:
	.align	2
.L91:
	.word	bullets
	.word	player
	.size	fire, .-fire
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0]
	cmp	r2, #0
	ldr	r3, [r0, #20]
	ble	.L95
	mov	ip, #18
	str	lr, [sp, #-4]!
	ldr	lr, [r0, #8]
	ldr	r1, .L103
	sub	r2, r2, lr
	ldr	lr, [r0, #4]
	str	r2, [r0]
	lsl	r0, r3, #3
	add	r3, r1, r3, lsl #3
	strh	r2, [r1, r0]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L95:
	mov	ip, #0
	ldr	r1, .L103
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #24]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L104:
	.align	2
.L103:
	.word	shadowOAM
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L120
	ldr	r3, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L120+4
	add	r3, r3, #1
	str	r3, [r2]
	add	r5, r4, #600
	bl	updatePlayer
	b	.L107
.L106:
	add	r4, r4, #40
	cmp	r5, r4
	beq	.L119
.L107:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L106
	mov	r0, r4
	add	r4, r4, #40
	bl	updateSprites.part.0
	cmp	r5, r4
	bne	.L107
.L119:
	ldr	r0, .L120+8
	bl	updateBullets
	ldr	r0, .L120+12
	bl	updateBullets
	ldr	r0, .L120+16
	bl	updateBullets
	ldr	r0, .L120+20
	bl	updateBullets
	ldr	r0, .L120+24
	bl	updateBullets
	ldr	r4, .L120+28
	add	r5, r4, #196
.L109:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEBullets.part.0
.L108:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L109
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	eBulletTimer
	.word	enemies
	.word	bullets
	.word	bullets+28
	.word	bullets+56
	.word	bullets+84
	.word	bullets+112
	.word	ebullets
	.size	updateGame, .-updateGame
	.align	2
	.global	updateEBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEBullets, %function
updateEBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateEBullets.part.0
	.size	updateEBullets, .-updateEBullets
	.align	2
	.global	updateSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSprites, %function
updateSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateSprites.part.0
	.size	updateSprites, .-updateSprites
	.align	2
	.global	dropBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropBullet, %function
dropBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	dropBullet.part.0
	.size	dropBullet, .-dropBullet
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
