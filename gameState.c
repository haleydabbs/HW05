#include "gameState.h"
#include "myLib.h"
#include "spriteSheet.h"

// Initializes game
void initGame() {

    // Set up sprite palette
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, spriteSheetPalLen/2);

    // Hide dem sprites
    hideSprites();

    // Set up player sprite
    player.width = 32;
    player.height = 32;
    player.cdel = 1;
    player.rdel = 1;
    player.col = SCREENWIDTH/2 - player.width/2;
    player.row = 100;
    player.aniCounter = 0;
    player.aniState = PLAYERUP;

}

// Update game
void updateGame() {

    shadowOAM[0].attr0 = player.row;
    shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID((player.aniState*2), 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);


}
