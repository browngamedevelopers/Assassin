server = argument0;
gridConfig = 0;
global.gameStart = false;

switch(gridConfig) {
    case 0:
        //Grid size Row/Col
        global.gameInfoServer[0] = 13; global.gameInfoServer[1] = 15;
        //Starting upper left corner x/y
        //(13 * 56 (sprite width) - 1/2 *56 (sprite width) )/2
        global.gameInfoServer[2] = 162 ; global.gameInfoServer[3] = 32;
        //Assassin pos x/y
        global.gameInfoServer[4] = 162+ 28 + 6*56; global.gameInfoServer[5] = 32 + 3/4*13*64;
        //Knight pos x/y
        global.gameInfoServer[6] = 162 + 7*56; global.gameInfoServer[7] = 32 + 3/4*10*64;
        
        //Map tiles
        global.gridServer[0, 0] = 0; global.gridServer[0, 1] = 0; global.gridServer[0, 2] = 2; global.gridServer[0, 3] = 1; global.gridServer[0, 4] = 0; 
        global.gridServer[0, 5] = 0; global.gridServer[0, 6] = 0; global.gridServer[0, 7] = 2; global.gridServer[0, 8] = 1; global.gridServer[0, 9] = 0; 
        global.gridServer[0, 10] = 0; global.gridServer[0, 11] = 0; global.gridServer[0, 12] = 2; global.gridServer[0, 13] = 1; global.gridServer[0, 14] = 0; 
        global.gridServer[1, 0] = 1; global.gridServer[1, 1] = 2; global.gridServer[1, 2] = 2; global.gridServer[1, 3] = 2; global.gridServer[1, 4] = 0; 
        global.gridServer[1, 5] = 1; global.gridServer[1, 6] = 2; global.gridServer[1, 7] = 2; global.gridServer[1, 8] = 2; global.gridServer[1, 9] = 0; 
        global.gridServer[1, 10] = 1; global.gridServer[1, 11] = 2; global.gridServer[1, 12] = 2; global.gridServer[1, 13] = 2; global.gridServer[1, 14] = 0;
        global.gridServer[2, 0] = 0; global.gridServer[2, 1] = 2; global.gridServer[2, 2] = 1; global.gridServer[2, 3] = 0; global.gridServer[2, 4] = 2; 
        global.gridServer[2, 5] = 0; global.gridServer[2, 6] = 2; global.gridServer[2, 7] = 1; global.gridServer[2, 8] = 0; global.gridServer[2, 9] = 2; 
        global.gridServer[2, 10] = 0; global.gridServer[2, 11] = 2; global.gridServer[2, 12] = 1; global.gridServer[2, 13] = 0; global.gridServer[2, 14] = 2; 
        global.gridServer[3, 0] = 2; global.gridServer[3, 1] = 0; global.gridServer[3, 2] = 0; global.gridServer[3, 3] = 1; global.gridServer[3, 4] = 0; 
        global.gridServer[3, 5] = 2; global.gridServer[3, 6] = 0; global.gridServer[3, 7] = 0; global.gridServer[3, 8] = 1; global.gridServer[3, 9] = 0; 
        global.gridServer[3, 10] = 2; global.gridServer[3, 11] = 0; global.gridServer[3, 12] = 0; global.gridServer[3, 13] = 1; global.gridServer[3, 14] = 0; 
        global.gridServer[4, 0] = 0; global.gridServer[4, 1] = 0; global.gridServer[4, 2] = 2; global.gridServer[4, 3] = 1; global.gridServer[4, 4] = 0; 
        global.gridServer[4, 5] = 0; global.gridServer[4, 6] = 0; global.gridServer[4, 7] = 2; global.gridServer[4, 8] = 1; global.gridServer[4, 9] = 0; 
        global.gridServer[4, 10] = 0; global.gridServer[4, 11] = 0; global.gridServer[4, 12] = 2; global.gridServer[4, 13] = 1; global.gridServer[4, 14] = 0; 
        global.gridServer[5, 0] = 1; global.gridServer[5, 1] = 2; global.gridServer[5, 2] = 2; global.gridServer[5, 3] = 2; global.gridServer[5, 4] = 0; 
        global.gridServer[5, 5] = 1; global.gridServer[5, 6] = 2; global.gridServer[5, 7] = 2; global.gridServer[5, 8] = 2; global.gridServer[5, 9] = 0;
        global.gridServer[5, 10] = 1; global.gridServer[5, 11] = 2; global.gridServer[5, 12] = 2; global.gridServer[5, 13] = 2; global.gridServer[5, 14] = 0; 
        global.gridServer[6, 0] = 0; global.gridServer[6, 1] = 2; global.gridServer[6, 2] = 1; global.gridServer[6, 3] = 0; global.gridServer[6, 4] = 2; 
        global.gridServer[6, 5] = 0; global.gridServer[6, 6] = 2; global.gridServer[6, 7] = 1; global.gridServer[6, 8] = 0; global.gridServer[6, 9] = 2; 
        global.gridServer[6, 10] = 0; global.gridServer[6, 11] = 2; global.gridServer[6, 12] = 1; global.gridServer[6, 13] = 0; global.gridServer[6, 14] = 2; 
        global.gridServer[7, 0] = 0; global.gridServer[7, 1] = 0; global.gridServer[7, 2] = 2; global.gridServer[7, 3] = 1; global.gridServer[7, 4] = 0; 
        global.gridServer[7, 5] = 0; global.gridServer[7, 6] = 0; global.gridServer[7, 7] = 2; global.gridServer[7, 8] = 1; global.gridServer[7, 9] = 0; 
        global.gridServer[7, 10] = 0; global.gridServer[7, 11] = 0; global.gridServer[7, 12] = 2; global.gridServer[7, 13] = 1; global.gridServer[7, 14] = 0; 
        global.gridServer[8, 0] = 1; global.gridServer[8, 1] = 2; global.gridServer[8, 2] = 2; global.gridServer[8, 3] = 2; global.gridServer[8, 4] = 0; 
        global.gridServer[8, 5] = 1; global.gridServer[8, 6] = 2; global.gridServer[8, 7] = 2; global.gridServer[8, 8] = 2; global.gridServer[8, 9] = 0; 
        global.gridServer[8, 10] = 1; global.gridServer[8, 11] = 2; global.gridServer[8, 12] = 2; global.gridServer[8, 13] = 2; global.gridServer[8, 14] = 0; 
        global.gridServer[9, 0] = 0; global.gridServer[9, 1] = 2; global.gridServer[9, 2] = 1; global.gridServer[9, 3] = 0; global.gridServer[9, 4] = 2; 
        global.gridServer[9, 5] = 0; global.gridServer[9, 6] = 2; global.gridServer[9, 7] = 1; global.gridServer[9, 8] = 0; global.gridServer[9, 9] = 2; 
        global.gridServer[9, 10] = 0; global.gridServer[9, 11] = 2; global.gridServer[9, 12] = 1; global.gridServer[9, 13] = 0; global.gridServer[9, 14] = 2; 
        global.gridServer[10, 0] = 2; global.gridServer[10, 1] = 0; global.gridServer[10, 2] = 0; global.gridServer[10, 3] = 1; global.gridServer[10, 4] = 0; 
        global.gridServer[10, 5] = 2; global.gridServer[10, 6] = 0; global.gridServer[10, 7] = 0; global.gridServer[10, 8] = 1; global.gridServer[10, 9] = 0; 
        global.gridServer[10, 10] = 2; global.gridServer[10, 11] = 0; global.gridServer[10, 12] = 0; global.gridServer[10, 13] = 1; global.gridServer[10, 14] = 0; 
        global.gridServer[11, 0] = 0; global.gridServer[11, 1] = 0; global.gridServer[11, 2] = 2; global.gridServer[11, 3] = 1; global.gridServer[11, 4] = 0; 
        global.gridServer[11, 5] = 0; global.gridServer[11, 6] = 0; global.gridServer[11, 7] = 2; global.gridServer[11, 8] = 1; global.gridServer[11, 9] = 0;
        global.gridServer[11, 10] = 0; global.gridServer[11, 11] = 0; global.gridServer[11, 12] = 2; global.gridServer[11, 13] = 1; global.gridServer[11, 14] = 0;
        global.gridServer[12, 0] = 1; global.gridServer[12, 1] = 2; global.gridServer[12, 2] = 2; global.gridServer[12, 3] = 2; global.gridServer[12, 4] = 0; 
        global.gridServer[12, 5] = 1; global.gridServer[12, 6] = 2; global.gridServer[12, 7] = 2; global.gridServer[12, 8] = 2; global.gridServer[12, 9] = 0; 
        global.gridServer[12, 10] = 1; global.gridServer[12, 11] = 2; global.gridServer[12, 12] = 2; global.gridServer[12, 13] = 2; global.gridServer[12, 14] = 0; 
        global.gridServer[13, 0] = 0; global.gridServer[13, 1] = 2; global.gridServer[13, 2] = 1; global.gridServer[13, 3] = 0; global.gridServer[13, 4] = 2; 
        global.gridServer[13, 5] = 0; global.gridServer[13, 6] = 2; global.gridServer[13, 7] = 1; global.gridServer[13, 8] = 0; global.gridServer[13, 9] = 2; 
        global.gridServer[13, 10] = 0; global.gridServer[13, 11] = 2; global.gridServer[13, 12] = 1; global.gridServer[13, 13] = 0; global.gridServer[13, 14] = 2;
        
      break;
}
server.alarm[0] = 30;
