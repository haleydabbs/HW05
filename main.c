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

int seed;

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

    }

    return 0;

}

void initialize() {

    // Enable BG registers amd DMA appropriate BG's

    // BG0 - Start
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(6) | BG_SIZE_SMALL;
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[6], startMapLen / 2);

    // BG1 - Game
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(14) | BG_SIZE_SMALL;
    DMANow(3, gameTiles, &CHARBLOCK[1], gameTilesLen / 2);
    DMANow(3, gameMap, &SCREENBLOCK[14], gameMapLen / 2);

    // BG2 - Pause
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(22) | BG_SIZE_SMALL;
    DMANow(3, pauseTiles, &CHARBLOCK[2], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[22], pauseMapLen / 2);

    // BG3 - Win & Lose
    REG_BG3CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL;

    // Display control register
    REG_DISPCTL = MODE0 | SPRITE_ENABLE;
    
    // Loading BG palette
    DMANow(3, startPal, PALETTE, 256);

    goToStart();

}

// Sets up start state
void goToStart() {
    
    // Loading start BG tiles
    REG_DISPCTL |= BG0_ENABLE;
    state = START;

}

// Runs every frame of start state
void start() {

    seed++; 

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear the BG0 bit to turn off start BG
        REG_DISPCTL &= ~(BG0_ENABLE);

        // Initialize game, then move to game state
        initGame();
        goToGame();

    }

}

// Sets up game state
void goToGame() {

    // Loading start BG tiles in BG 1
    REG_DISPCTL |= BG1_ENABLE | SPRITE_ENABLE;
    state = GAME;

}

// Runs every frame of game
void game() {

    // Update sprite positions in game, draw sprites, wait for vblank, and copy shadow OAM into OAM
    updateGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, (((sizeof(shadowOAM))/4) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_INCREMENT | DMA_32));

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        
        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToPause();

    } else if (eRemaining == 0) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToWin();

    } else if (BUTTON_PRESSED(BUTTON_B)) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToLose();

    }

}

// Sets up pause state
void goToPause() {

    // Set up BG2 for pause screen
    REG_DISPCTL |= BG2_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);
    state = PAUSE;

}

// Runs every frame of pause
void pause() {

    // Start button pressed, return to game
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG2 bit
        REG_DISPCTL &= ~(BG2_ENABLE);
        goToGame();

    } 

}

// Sets up win state
void goToWin() {

    // Enable BG3 for win screen
    REG_DISPCTL |= BG3_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading win BG tiles
    DMANow(3, winTiles, &CHARBLOCK[3], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[30], winMapLen / 2);

    state = WIN;

}

// Runs every frame of win
void win() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG3 bit
        REG_DISPCTL &= ~(BG3_ENABLE);
        goToStart();

    }

}

// Sets up lose state
void goToLose() {

    // Enable BG3 for lose screen
    REG_DISPCTL |= BG3_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading lose BG tiles
    DMANow(3, loseTiles, &CHARBLOCK[3], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[30], loseMapLen / 2);

    state = LOSE;

}

// Runs every grame of lose
void lose() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG3 bit
        REG_DISPCTL &= ~(BG3_ENABLE);
        goToStart();

    }

}