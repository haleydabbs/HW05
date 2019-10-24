# 1 "gameState.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gameState.c"
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
# 2 "gameState.c" 2
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
# 3 "gameState.c" 2
# 1 "spriteSheet.h" 1
# 21 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetPal[256];
# 4 "gameState.c" 2


void initGame() {


    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 512/2);


    hideSprites();


    player.width = 32;
    player.height = 32;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 240/2 - player.width/2;
    player.row = 100;
    player.aniCounter = 0;
    player.aniState = PLAYERUP;

}


void updateGame() {

    shadowOAM[0].attr0 = player.row;
    shadowOAM[0].attr1 = player.col | (2<<14);
    shadowOAM[0].attr2 = ((0)*32+((player.aniState*2))) | ((0)<<12) | ((0)<<10);


}
