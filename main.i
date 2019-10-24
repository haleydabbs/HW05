# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "main.c" 2
# 1 "gameState.h" 1


typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
} SPRITE;

SPRITE player;


enum { PLAYERUP, PLAYERRIGHT, PLAYERLEFT};


void initGame();
void updateGame();
void drawGame();
# 4 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[48];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 5 "main.c" 2
# 1 "game.h" 1
# 22 "game.h"
extern const unsigned short gameTiles[48];


extern const unsigned short gameMap[1024];


extern const unsigned short gamePal[256];
# 6 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[48];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 7 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[48];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 8 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[48];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 9 "main.c" 2


void initialize();

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


enum { START, GAME, PAUSE, WIN, LOSE };
int state;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((8)<<8) | (0<<14);


    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


    DMANow(3, startPal, ((unsigned short *)0x5000000), 256);

    goToStart();

}


void goToStart() {


    DMANow(3, startTiles, &((charblock *)0x6000000)[0], 96 / 2);
    DMANow(3, startMap, &((screenblock *)0x6000000)[8], 2048 / 2);

    state = START;

}


void start() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        initGame();
        goToGame();

    }

}


void goToGame() {


    DMANow(3, gameTiles, &((charblock *)0x6000000)[0], 96 / 2);
    DMANow(3, gameMap, &((screenblock *)0x6000000)[8], 2048 / 2);

    state = GAME;

}


void game() {


    updateGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (((sizeof(shadowOAM))/4) | (0 << 21) | (0 << 23) | (1 << 26)));


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToPause();

    } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {

        goToWin();

    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {

        goToLose();

    }

}


void goToPause() {


    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 96 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[8], 2048 / 2);

    state = PAUSE;

}


void pause() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToGame();

    }

}


void goToWin() {


    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 96 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[8], 2048 / 2);

    state = WIN;

}


void win() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToStart();

    }

}


void goToLose() {


    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 96 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[8], 2048 / 2);

    state = LOSE;

}


void lose() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToStart();

    }

}
