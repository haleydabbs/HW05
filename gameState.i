# 1 "gameState.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gameState.c"
# 1 "gameState.h" 1



typedef struct {
    int row;
    int col;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int vel;
} PLAYERSPRITE;


typedef struct {
    int row;
    int col;
    int cvel;
    int rvel;
    int width;
    int height;
    int OAMposition;
    int ssPos;
    int active;
} ENEMY;

typedef struct {
    int row;
    int col;
    int rvel;
    int width;
    int height;
    int OAMposition;
    int active;
} BULLETS;

typedef struct {
    int row;
    int col;
    int rvel;
    int width;
    int height;
    int OAMposition;
    int active;
} EBULLET;
# 55 "gameState.h"
PLAYERSPRITE player;
int eRemaining;
ENEMY enemies[15];
BULLETS bullets[5];
EBULLET ebullets[3];
int enemyDropCountdown;


enum { PLAYERUP, PLAYERRIGHT, PLAYERLEFT};


void initGame();
void initEnemy(ENEMY*, int);
void initBullets(BULLETS*, int);
void initEBullets(EBULLET* e, int);
void updateGame();
void updateSprites(ENEMY* e);
void updatePlayer();
void updateBullets(BULLETS* b);
void updateEBullets(EBULLET* e);
void fire();
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

int eRemaining;


void initGame() {


    enemyDropCountdown = 0;


    DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spriteSheetPal, ((unsigned short *)0x5000200), 512/2);


    hideSprites();

    eRemaining = 15;


    player.width = 32;
    player.height = 32;
    player.col = 240/2 - player.width/2;
    player.row = 120;
    player.aniCounter = 0;
    player.aniState = PLAYERUP;
    player.vel = 3;


    for (int i = 0; i < 15; i++) {
        initEnemy(&enemies[i], i);
    }


    for (int i = 0; i < 5; i++) {
        initBullets(&bullets[i], i);
    }






}


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


void initBullets(BULLETS* b, int i) {

    b -> width = 8;
    b -> height = 8;
    b -> col = 0;
    b -> row = 0;
    b -> rvel = 3;
    b -> OAMposition = 18 + i;
    b -> active = 0;

}
# 101 "gameState.c"
void updateGame() {


    enemyDropCountdown++;


    updatePlayer();

    for (int i = 0; i < 15; i++) {
        updateSprites(&enemies[i]);
    }

}


void updatePlayer() {


    if (!(player.aniState == PLAYERUP)) {
        player.prevAniState = player.aniState;
        player.aniState = PLAYERUP;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {


        player.aniState = PLAYERLEFT;
        if (player.col - 2 > 0) {
            player.col -= player.vel;
        }

    } if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {


        player.aniState = PLAYERRIGHT;
        if (player.col + player.width < 240) {
            player.col += player.vel;
        }

    } if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {


        fire();

    }

    for (int i = 0; i < 5; i++) {
        updateBullets(&bullets[i]);
    }


    shadowOAM[0].attr0 = player.row;
    shadowOAM[0].attr1 = player.col | (2<<14);
    shadowOAM[0].attr2 = ((0)*32+((player.aniState*2))) | ((0)<<12) | ((0)<<10);

}


void fire() {

    for (int i = 0; i < 5; i++) {
        if (!(bullets[i].active)) {
            bullets[i].active = 1;
            bullets[i].col = player.col + 12;
            bullets[i].row = player.row;
            break;
        }
    }

}


void updateBullets(BULLETS* b) {
    if (b->active) {

            if (b->row > 0) {


                b->row -= b->rvel;


                shadowOAM[b->OAMposition].attr0 = b->row;
                shadowOAM[b->OAMposition].attr1 = b->col | (1<<14);
                shadowOAM[b->OAMposition].attr2 = ((0)*32+((18))) | ((0)<<12) | ((0)<<10);

            } else {

                b->active = 0;
                shadowOAM[b->OAMposition].attr0 |= (2<<8);

            }

    }
}


void updateSprites(ENEMY* e) {


        if (e->active) {


            if (enemyDropCountdown == 20) {


            }



            shadowOAM[e->OAMposition].attr0 = e->row;
            shadowOAM[e->OAMposition].attr1 = e->col | (1<<14);
            shadowOAM[e->OAMposition].attr2 = ((0)*32+((e->ssPos))) | ((1)<<12) | ((0)<<10);


            for (int i = 0; i < 5; i++) {

                if (bullets[i].active
                && (collision(bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height, e->col, e->row, e->width, e->height))) {


                    bullets[i].active = 0;
                    shadowOAM[bullets[i].OAMposition].attr0 = (2<<8);


                    e->active = 0;
                    shadowOAM[e->OAMposition].attr0 = (2<<8);


                    eRemaining--;

                }
            }
        }

}
