// Include needed h files
#include "myLib.h"
#include "gameState.h"
#include "start.h"
#include "game.h"
#include "pause.h"
#include "lose.h"
#include "win.h"

// Function prototype
void initialize();
// State functions
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

// Game states enum
enum { START, GAME, PAUSE, WIN, LOSE };
int state;

int main() {

    initialize();

    while(1) {

        // Update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // State switch
        switch(state) {
            
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;

        }

        // waitForVBlank();

        // Copy shadowOAM into OAM
        // DMANow(3, shadowOAM, OAM, (((sizeof(shadowOAM))/4) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_INCREMENT | DMA_32));

    }

    return 0;

}

void initialize() {

    // Enable BG 0 register
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_SMALL;

    // Display control register
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    
    // Loading BG palette
    DMANow(3, startPal, PALETTE, 256);

    goToStart();

}

// Sets up start state
void goToStart() {
    
    // Loading start BG tiles
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[8], startMapLen / 2);

    state = START;

}

// Runs every frame of start state
void start() {

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {

        initGame();
        goToGame();

    }

}

// Sets up game state
void goToGame() {

    // Loading game BG tiles
    DMANow(3, gameTiles, &CHARBLOCK[0], gameTilesLen / 2);
    DMANow(3, gameMap, &SCREENBLOCK[8], gameMapLen / 2);

    state = GAME;

}

// Runs every frame of game
void game() {

    // Update game, wait for vblank, and copy shadow OAM into OAM
    updateGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, (((sizeof(shadowOAM))/4) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_INCREMENT | DMA_32));

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToPause();

    } else if (BUTTON_PRESSED(BUTTON_A)) {

        goToWin();

    } else if (BUTTON_PRESSED(BUTTON_B)) {

        goToLose();

    }

}

// Sets up pause state
void goToPause() {

    // Loading pause BG tiles
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[8], pauseMapLen / 2);

    state = PAUSE;

}

// Runs every frame of pause
void pause() {

    // Start button pressed, return to game
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToGame();

    } 

}

// Sets up win state
void goToWin() {

    // Loading pause BG tiles
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[8], winMapLen / 2);

    state = WIN;

}

// Runs every frame of win
void win() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToStart();

    }

}

// Sets up lose state
void goToLose() {

    // Loading pause BG tiles
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[8], loseMapLen / 2);

    state = LOSE;

}

// Runs every grame of lose
void lose() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToStart();

    }

}