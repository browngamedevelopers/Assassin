server = argument0;
gridConfig = 0;
global.gameStart = false;

switch(gridConfig) {
    case 0:
        //Grid size Row/Col
        global.gameInfoServer[0] = 7; global.gameInfoServer[1] = 6;
        //Starting upper left corner x/y
        global.gameInfoServer[2] = 100; global.gameInfoServer[3] = 100;
        //Assassin pos x/y
        global.gameInfoServer[4] = 0; global.gameInfoServer[5] = 0;
        //Knight pos x/y
        global.gameInfoServer[6] = 0; global.gameInfoServer[7] = 0;
        
        //Map tiles
        global.gridServer[0, 0] = 0; global.gridServer[0, 1] = 0; global.gridServer[0, 2] = 2; global.gridServer[0, 3] = 1; global.gridServer[0, 4] = 0; global.gridServer[0, 5] = 1;
        global.gridServer[1, 0] = 1; global.gridServer[1, 1] = 2; global.gridServer[1, 2] = 2; global.gridServer[1, 3] = 2; global.gridServer[1, 4] = 0; global.gridServer[1, 5] = 2;
        global.gridServer[2, 0] = 0; global.gridServer[2, 1] = 2; global.gridServer[2, 2] = 1; global.gridServer[2, 3] = 0; global.gridServer[2, 4] = 2; global.gridServer[2, 5] = 0;
        global.gridServer[3, 0] = 2; global.gridServer[3, 1] = 0; global.gridServer[3, 2] = 0; global.gridServer[3, 3] = 1; global.gridServer[3, 4] = 0; global.gridServer[3, 5] = 0;
        global.gridServer[4, 0] = 0; global.gridServer[4, 1] = 0; global.gridServer[4, 2] = 2; global.gridServer[4, 3] = 1; global.gridServer[4, 4] = 0; global.gridServer[4, 5] = 1;
        global.gridServer[5, 0] = 1; global.gridServer[5, 1] = 2; global.gridServer[5, 2] = 2; global.gridServer[5, 3] = 2; global.gridServer[5, 4] = 0; global.gridServer[5, 5] = 2;
        global.gridServer[6, 0] = 0; global.gridServer[6, 1] = 2; global.gridServer[6, 2] = 1; global.gridServer[6, 3] = 0; global.gridServer[6, 4] = 2; global.gridServer[6, 5] = 0;
        
      break;
}
server.alarm[0] = 30;
