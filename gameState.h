// Structs
// aniCounter is currently vestigal
// Player
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
// Enemies
// rvel and cvel are currently vestigal
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
// Bullets
typedef struct {
    int row;
    int col;
    int rvel;
    int width;
    int height;
    int OAMposition;
    int active;
} BULLETS;
// Enemy bullets
typedef struct {
    int row;
    int col;
    int rvel;
    int width;
    int height;
    int OAMposition;
    int active;
} EBULLET;

// Constants
# define ENEMYCOUNT 15
# define BULLETCOUNT 5
# define EBULLETCOUNT 3
# define COUNTDOWN 20
# define LIVES 5

// Variables
PLAYERSPRITE player;
int eRemaining;
ENEMY enemies[ENEMYCOUNT];
BULLETS bullets[BULLETCOUNT];
EBULLET ebullets[EBULLETCOUNT];
int livesRemaining;
int randomEnemy;
int randomChanceforDrop;

// Player state enum
enum { PLAYERUP, PLAYERRIGHT, PLAYERLEFT};

// Functions
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
void dropBullet(ENEMY* e);