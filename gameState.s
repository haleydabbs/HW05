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
	.type	updateSprites.part.0, %function
updateSprites.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #0
	ldr	r3, [r0, #24]
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #28]
	ldr	r7, .L13
	ldr	ip, [r0]
	mov	r5, r0
	ldr	r4, .L13+4
	lsl	r0, r3, #3
	orr	r1, r1, #16384
	add	r3, r7, r3, lsl #3
	orr	r2, r2, #4096
	strh	ip, [r7, r0]	@ movhi
	ldr	r9, .L13+8
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	r10, .L13+12
	sub	sp, sp, #16
	add	r6, r4, #140
.L5:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L12
.L3:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L12:
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
	bx	r9
	cmp	r0, #0
	beq	.L3
	mov	r0, #512
	str	r8, [r4, #24]
	ldr	r1, [r4, #20]
	ldr	r3, [r5, #24]
	ldr	r2, [r10]
	lsl	r1, r1, #3
	lsl	r3, r3, #3
	sub	r2, r2, #1
	strh	r0, [r7, r1]	@ movhi
	str	r2, [r10]
	str	r8, [r5, #32]
	strh	r0, [r7, r3]	@ movhi
	b	.L3
.L14:
	.align	2
.L13:
	.word	shadowOAM
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
	mov	r3, #16
	mov	r2, #0
	str	lr, [sp, #-4]!
	cmp	r1, #4
	add	lr, r1, ip
	str	lr, [r0, #24]
	str	ip, [r0, #32]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	bgt	.L16
	mov	r2, #100
	mov	r3, #12
	lsl	r1, r1, #4
	stm	r0, {r1, r2}
	str	r3, [r0, #28]
.L15:
	ldr	lr, [sp], #4
	bx	lr
.L16:
	cmp	r1, #9
	bgt	.L18
	mov	r2, #116
	mov	r3, #14
	sub	r1, r1, #5
	lsl	r1, r1, #4
	stm	r0, {r1, r2}
	str	r3, [r0, #28]
	ldr	lr, [sp], #4
	bx	lr
.L18:
	cmp	r1, #14
	bgt	.L15
	mov	r2, #132
	sub	r1, r1, #10
	lsl	r1, r1, #4
	str	r1, [r0]
	str	r3, [r0, #28]
	str	r2, [r0, #4]
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
	mov	r5, #0
	ldr	ip, .L26
	ldr	r4, .L26+4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L26+8
	ldr	r1, .L26+12
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L26+16
	ldr	r1, .L26+20
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+24
	mov	lr, pc
	bx	r3
	mov	r1, #104
	mov	r2, #32
	mov	r0, #15
	mov	lr, #120
	mov	ip, #3
	mov	r4, r5
	ldr	r3, .L26+28
	str	r1, [r3, #4]
	ldr	r1, .L26+32
	str	r5, [r3, #16]
	str	r0, [r1]
	str	r5, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r0, .L26+36
.L21:
	mov	r1, r4
	bl	initEnemy
	add	r4, r4, #1
	cmp	r4, #15
	add	r0, r0, #36
	bne	.L21
	mov	r2, #18
	mov	r0, #8
	mov	r1, #0
	mov	ip, #3
	ldr	r3, .L26+40
.L22:
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
	bne	.L22
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	enemyDropCountdown
	.word	DMANow
	.word	100728832
	.word	spriteSheetTiles
	.word	83886592
	.word	spriteSheetPal
	.word	hideSprites
	.word	player
	.word	eRemaining
	.word	enemies
	.word	bullets
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
	mov	ip, #3
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
	.global	fire
	.syntax unified
	.arm
	.fpu softvfp
	.type	fire, %function
fire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L40
	mov	r2, r0
	ldr	r1, [r2, #24]
	cmp	r1, #0
	mov	r3, #0
	beq	.L39
.L30:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L30
.L39:
	mov	ip, #1
	ldr	r1, .L40+4
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
.L41:
	.align	2
.L40:
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
	ble	.L44
	str	lr, [sp, #-4]!
	mov	lr, #18
	ldmib	r0, {r1, ip}
	sub	r2, r2, ip
	ldr	ip, .L52
	str	r2, [r0]
	orr	r1, r1, #16384
	lsl	r0, r3, #3
	add	r3, ip, r3, lsl #3
	strh	r2, [ip, r0]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L44:
	mov	ip, #0
	ldr	r1, .L52
	lsl	r3, r3, #3
	ldrh	r2, [r1, r3]
	orr	r2, r2, #512
	str	ip, [r0, #24]
	strh	r2, [r1, r3]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
	.word	shadowOAM
	.size	updateBullets, .-updateBullets
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
	push	{r4, lr}
	ldr	r4, .L74
	ldr	r3, [r4, #20]
	cmp	r3, #0
	movne	r2, #0
	strne	r3, [r4, #24]
	ldr	r3, .L74+4
	ldrh	r3, [r3, #48]
	strne	r2, [r4, #20]
	tst	r3, #32
	bne	.L57
	mov	r2, #2
	ldr	r3, [r4, #4]
	cmp	r3, r2
	str	r2, [r4, #20]
	ldrgt	r2, [r4, #28]
	subgt	r3, r3, r2
	strgt	r3, [r4, #4]
.L57:
	ldr	r3, .L74+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L60
	mov	r1, #1
	ldmib	r4, {r2, r3}
	add	r3, r2, r3
	cmp	r3, #239
	ldrle	r3, [r4, #28]
	addle	r2, r3, r2
	str	r1, [r4, #20]
	strle	r2, [r4, #4]
.L60:
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L62
	ldr	r3, .L74+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L62
	ldr	r0, .L74+16
	mov	r2, r0
.L64:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L73
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bne	.L64
.L62:
	ldr	r0, .L74+16
	bl	updateBullets
	ldr	r0, .L74+20
	bl	updateBullets
	ldr	r0, .L74+24
	bl	updateBullets
	ldr	r0, .L74+28
	bl	updateBullets
	ldr	r0, .L74+32
	bl	updateBullets
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r4, #20]
	ldr	r0, [r4]
	ldr	r2, .L74+36
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L73:
	mov	r1, #1
	ldr	r2, [r4, #4]
	ldr	ip, [r4]
	rsb	r3, r3, r3, lsl #3
	str	ip, [r0, r3, lsl #2]
	add	r2, r2, #12
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #24]
	str	r2, [r3, #4]
	b	.L62
.L75:
	.align	2
.L74:
	.word	player
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	bullets+28
	.word	bullets+56
	.word	bullets+84
	.word	bullets+112
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
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
	ldr	r2, .L84
	ldr	r3, [r2]
	push	{r4, r5, r6, lr}
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	ldr	r4, .L84+4
	add	r5, r4, #540
.L78:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	updateSprites.part.0
.L77:
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L78
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	enemyDropCountdown
	.word	enemies
	.size	updateGame, .-updateGame
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
	.comm	enemyDropCountdown,4,4
	.comm	ebullets,84,4
	.comm	bullets,140,4
	.comm	enemies,540,4
	.comm	eRemaining,4,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
