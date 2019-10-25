#include "gameState.h"
#include "myLib.h"
#include "spriteSheet.h"
#include <stdlib.h>
#include <stdio.h>

// Initializes game
void initGame() {

    // Init points variables
    livesRemaining = LIVES;
    eRemaining = 15;

    // Set up sprite palette
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, spriteSheetPalLen/2);

    // Hide dem sprites
    hideSprites();

    // Set up player sprite
    player.width = 32;
    player.height = 32;
    player.col = SCREENWIDTH/2 - player.width/2;
    player.row = 120;
    player.aniCounter = 0;
    player.aniState = PLAYERUP;
    player.vel = 2;

    // Init enemies
    for (int i = 0; i < ENEMYCOUNT; i++) {
        initEnemy(&enemies[i], i);
    }

    // Init bullets
    for (int i = 0; i < BULLETCOUNT; i++) {
        initBullets(&bullets[i], i);
    }

    // Init enemy bullets
    for (int f = 0; f < EBULLETCOUNT; f++) {
        initEBullets(&ebullets[f], f);
    }

}

// Helper to initialize enemies
void initEnemy(ENEMY* e, int i) {

    e -> width = 16;
    e -> height = 16;
    e -> cvel = 0;
    e -> rvel = 0;
    e -> OAMposition = 1 + i;
    e -> active = 1;

    if (i < 5) {
        e -> col = 100;
        e -> row = i * 16;
        e -> ssPos = 12;
    } else if (i < 10) {
        e -> col = 100 + 16;
        e -> row = (i - 5) * 16;
        e -> ssPos = 14;
    } else if (i < 15) {
        e -> col = 100 + 32;
        e -> row = (i - 10) * 16;
        e -> ssPos = 16;
    }

}

// Helper to init bullets
void initBullets(BULLETS* b, int i) {

    b -> width = 8;
    b -> height = 8;
    b -> col = 0;
    b -> row = 0;
    b -> rvel = 2;
    b -> OAMposition = 18 + i;
    b -> active = 0;
    
}

// Helper to init enemy bullets
void initEBullets(EBULLET* e, int i) {

    e -> width = 8;
    e -> height = 8;
    e -> col = 0;
    e -> row = 0;
    e -> rvel = 2;
    e -> OAMposition = 33 + i;
    e -> active = 0;

}

// Update game
void updateGame() {

    // Update sprite attributes for player sprite
    updatePlayer();

    // Update sprite attributes for the enemy sprites
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateSprites(&enemies[i]);
    }

    // Pick random enemy and drop bullet
    randomEnemy = ( rand() % 13 ) + 1;
    randomChanceforDrop = (rand() % 50);
    if (randomChanceforDrop > 48) {
    dropBullet(&enemies[randomEnemy]);
    }

    // Update bullets
    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullets(&bullets[i]);
    }

    // Update enemy bullets
    for (int i = 0; i < EBULLETCOUNT; i++) {
        updateEBullets(&ebullets[i]);
    }

}

// Helper function to update player
void updatePlayer() {

    // Set player to up position when idle
    if (!(player.aniState == PLAYERUP)) {
        player.prevAniState = player.aniState;
        player.aniState = PLAYERUP;
    }

    // Movement controls
    if(BUTTON_HELD(BUTTON_LEFT)) {

        // Move player left
        player.aniState = PLAYERLEFT;
        if (player.col - 2 > 0) {
            player.col -= player.vel;
        }  

    } if(BUTTON_HELD(BUTTON_RIGHT)) {

        // Move player right
        player.aniState = PLAYERRIGHT;
        if (player.col + player.width < 240) {
            player.col += player.vel;
        }

    } if(BUTTON_PRESSED(BUTTON_A)) {

        // Shoot a bullet
        fire();

    }

    // Draw player with updated positions
    shadowOAM[0].attr0 = player.row;
    shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID((player.aniState*4), 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}

// Helper function to fire a bullet
void fire() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!(bullets[i].active)) {
            bullets[i].active = 1;
            bullets[i].col = player.col + 12;
            bullets[i].row = player.row;
            break;
        }
    }

}

// Helper to update bullets
void updateBullets(BULLETS* b) {
    if (b->active) {

            if (b->row > 0) {

                // Update bullet position
                b->row -= b->rvel;

                // Draw bullet in shadowOAM
                shadowOAM[b->OAMposition].attr0 = b->row;
                shadowOAM[b->OAMposition].attr1 = b->col | ATTR1_TINY;
                shadowOAM[b->OAMposition].attr2 = ATTR2_TILEID((18), 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

            } else {

                b->active = 0;
                shadowOAM[b->OAMposition].attr0 |= ATTR0_HIDE;

            }

    }
}

// Helper to update enemy bullets
void updateEBullets(EBULLET* b) {

    if (b->active) {

        if ((b->row + b->height) < 160) {

            // Update bullet position
            b->row += b->rvel;

            // Draw bullet in shadowOAM
            shadowOAM[b->OAMposition].attr0 = b->row;
            shadowOAM[b->OAMposition].attr1 = b->col | ATTR1_TINY;
            shadowOAM[b->OAMposition].attr2 = ATTR2_TILEID((19), 0) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);

            // Check for collision with player
            if (collision(b->col, b->row, b->width, b->height, player.col, player.row, player.width, player.height)) {

                // If there is a collision, decrement lives remaining
                livesRemaining--;
                // and hide bullet
                b->active = 0;
                shadowOAM[b->OAMposition].attr0 |= ATTR0_HIDE;

            }

        } else {

            b->active = 0;
            shadowOAM[b->OAMposition].attr0 |= ATTR0_HIDE;

        }

    }

}

// Helper function to update sprites
void updateSprites(ENEMY* e) {
        
        // If enemy is active, then draw it
        if (e->active) {
            
            // TODO in HW06, update sprite movement
            // for now, position will be stationary
            shadowOAM[e->OAMposition].attr0 = e->row;
            shadowOAM[e->OAMposition].attr1 = e->col | ATTR1_SMALL;
            shadowOAM[e->OAMposition].attr2 = ATTR2_TILEID((e->ssPos), 0) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);

            // Check for bullet collisions
            for (int i = 0; i < BULLETCOUNT; i++) {
                
                if (bullets[i].active
                && (collision(bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height, e->col, e->row, e->width, e->height))) {
                    
                    // If there is a collision, make bullet inactive and hide sprite
                    bullets[i].active = 0;
                    shadowOAM[bullets[i].OAMposition].attr0 = ATTR0_HIDE;

                    // If there is a collision, make enemy inactive and hide sprite
                    e->active = 0;
                    shadowOAM[e->OAMposition].attr0 = ATTR0_HIDE;

                    // Lastly, decrement enemies remaining
                    eRemaining--;

                }
            }
        }

}

void dropBullet(ENEMY* e) {

        if (e->active) {

            // find inactive enemy bullet in enemy bullet pool
            for (int i = 0; i < EBULLETCOUNT; i++) {
                if (!(ebullets[i].active)) {
                    ebullets[i].active = 1;
                    ebullets[i].col = e->col + (e->width >> 2);
                    ebullets[i].row = e->row + (e->height >> 2);
                    break;
                }
            }

        }

}


