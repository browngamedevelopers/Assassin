gridConfig = 0;
global.gameStart = false;

switch(gridConfig) {
    case 0:
        //Grid size Row/Col
        global.gameInfoServer[0] = 4; global.gameInfoServer[1] = 6;
        //Starting upper left corner x/y
        global.gameInfoServer[2] = 250; global.gameInfoServer[3] = 250;
        //Assassin pos x/y
        global.gameInfoServer[4] = 0; global.gameInfoServer[5] = 0;
        //Knight pos x/y
        global.gameInfoServer[6] = 0; global.gameInfoServer[7] = 0;
        
        //Map tiles
        global.gridServer[0, 0] = 0; global.gridServer[0, 1] = 0; global.gridServer[0, 2] = 2; global.gridServer[0, 3] = 1; global.gridServer[0, 4] = 0; global.gridServer[0, 5] = 1;
        global.gridServer[1, 0] = 1; global.gridServer[1, 1] = 2; global.gridServer[1, 2] = 2; global.gridServer[1, 3] = 2; global.gridServer[1, 4] = 0; global.gridServer[1, 5] = 2;
        global.gridServer[2, 0] = 0; global.gridServer[2, 1] = 2; global.gridServer[2, 2] = 1; global.gridServer[2, 3] = 0; global.gridServer[2, 4] = 2; global.gridServer[2, 5] = 0;
        global.gridServer[3, 0] = 2; global.gridServer[3, 1] = 0; global.gridServer[3, 2] = 0; global.gridServer[3, 3] = 1; global.gridServer[3, 4] = 0; global.gridServer[3, 5] = 0;
    break;
}
