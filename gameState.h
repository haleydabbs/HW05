// Structs
// Player
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

// Player state enum
enum { PLAYERUP, PLAYERRIGHT, PLAYERLEFT};

// Functions
void initGame();
void updateGame();
void drawGame();