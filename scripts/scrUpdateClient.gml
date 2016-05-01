client = argument0;
buffer = argument1;

header = buffer_read(buffer, buffer_u8);
switch(header) {
    case PKT_UPDATE_INFO:
        show_debug_message("Updated Info");
        
        messengerx = buffer_read(buffer, buffer_s16);
        messengery = buffer_read(buffer, buffer_s16);
        knightx = buffer_read(buffer, buffer_s16);
        knighty = buffer_read(buffer, buffer_s16);
        
        instance_create(messengerx, messengery, objMessenger);
        instance_create(knightx, knighty, objKnight);
        instance_create(room_width/2, 107, objCastle);
    break;
    case PKT_UPDATE_MAP:
        show_debug_message("Updated Grid");
        row = buffer_read(buffer, buffer_s16);
        col = buffer_read(buffer, buffer_s16);
        lx = buffer_read(buffer, buffer_s16);
        ly = buffer_read(buffer, buffer_s16);
        
        var i,j, xoff, yoff;

        yoff = 0;
        for(i = 0; i < col; i++) {
            if((i mod 2) != 0) {
                xoff = 0;
            } else {
                xoff = sprite_get_width(sprTile) / 2;
            }
            
            for(j = 0; j < row; j++) {
                tile = instance_create(xoff + lx, yoff + ly, objTile);
                var subimg = buffer_read(buffer, buffer_s16);
                if(subimg == 4) {
                   with(tile) { instance_destroy();}
                }else {
                    var rand2 = irandom(1);
                    tile.image_index = 2*subimg + rand2;
                    global.gridClient[i, j] = tile;
                    xoff += sprite_get_width(sprTile);
                }
            }
            //yoff += sprite_get_height(sprTile)*3/4;
            yoff += 64*3/4; //since they have tops, they aren't at the right height, this is the current tile height
        }
    break;
    case PKT_UPDATE_READY:
        global.turn = buffer_read(buffer, buffer_s16);
        global.messenger = global.turn;
        global.start = true;
        
        //Tell surrounding tiles
        if(global.turn){
            var myposx = 0;
            var myposy = 0;
            if(global.messenger){
                myposx = objMessenger.x;
                myposy = objMessenger.y;
            }else {
                myposx = objKnight.x;
                myposy = objKnight.y;
            }
            var tile;
            tile[1] = instance_position(myposx - sprite_get_width(sprTile),myposy,objTile);
            tile[2] = instance_position(myposx - sprite_get_width(sprTile)/2,myposy-3/4*sprite_get_height(sprTile),objTile);
            tile[3] = instance_position(myposx + sprite_get_width(sprTile)/2,myposy-3/4*sprite_get_height(sprTile),objTile);
            tile[4] = instance_position(myposx + sprite_get_width(sprTile),myposy,objTile);
            tile[5] = instance_position(myposx + sprite_get_width(sprTile)/2,myposy+3/4*sprite_get_height(sprTile),objTile);
            tile[6] = instance_position(myposx - sprite_get_width(sprTile)/2,myposy+3/4*sprite_get_height(sprTile),objTile);
            for(i = 1; i < 7; i++) {                
                if(tile[i] != noone && tile[i].image_index != 4 && tile[i].image_index != 5
                && !(global.messenger && tile[i].x == objKnight.x && tile[i].y == objKnight.y)){
                    tile[i].canmove = true;
                    instance_create(tile[i].x, tile[i].y, objHighlight);
                }else {
                //show_debug_message("nope!");    
                }
            }
            if(!global.messenger){
                tile[7] = instance_position(myposx, myposy, objTile);
                tile[7].canmove = true;
                instance_create(tile[7].x, tile[7].y, objHighlight);            
            }
        }
        room_goto(rmGame);
    break;
    case PKT_UPDATE_TURN:
        event = buffer_read(buffer, buffer_s16);
        
        if(global.messenger) {
            switch(event) {
                case 0: //Move
                    objKnight.x = buffer_read(buffer, buffer_s16);
                    objKnight.y = buffer_read(buffer, buffer_s16);
                break;
                case 1: //Footprints
                    var footprint;
                    footprint[0] = instance_position(objKnight.x, objKnight.y, objFootprint);
                    footprint[1] = instance_position(objKnight.x - sprite_get_width(sprTile),objKnight.y,objFootprint);
                    footprint[2] = instance_position(objKnight.x - sprite_get_width(sprTile)/2,objKnight.y-3/4*sprite_get_height(sprTile),objFootprint);
                    footprint[3] = instance_position(objKnight.x + sprite_get_width(sprTile)/2,objKnight.y-3/4*sprite_get_height(sprTile),objFootprint);
                    footprint[4] = instance_position(objKnight.x + sprite_get_width(sprTile),objKnight.y,objFootprint);
                    footprint[5] = instance_position(objKnight.x + sprite_get_width(sprTile)/2,objKnight.y+3/4*sprite_get_height(sprTile),objFootprint);
                    footprint[6] = instance_position(objKnight.x - sprite_get_width(sprTile)/2,objKnight.y+3/4*sprite_get_height(sprTile),objFootprint);
                    
                    var i;
                    for(i = 0; i < 7; i++) {
                        if(footprint[i] != noone) {
                            footprint[i].visible = true;
                        }
                    }
                break;
                case 2: //Net
                    clickx = buffer_read(buffer, buffer_s16);
                    clicky = buffer_read(buffer, buffer_s16);
                    instance_create(clickx, clicky, objNetAnimation);
                    
                    if(clickx == objMessenger.x && clicky == objMessenger.y) {
                        show_message("Knight wins!");
                        //End game
                    }
                break;
            }
        } else {
        
            with(objTurnCounter) {
                event_user(0);
            }
            with(objFootprint) {
                visible = false;
                event_user(0);
            }
            //Move
            objMessenger.visible = false;
            objMessenger.x = buffer_read(buffer, buffer_s16);
            objMessenger.y = buffer_read(buffer, buffer_s16);
            
            tile = instance_position(objMessenger.x, objMessenger.y, objTile);
            if(tile.image_index == 6 || tile.image_index == 7) {
                objMessenger.visible = true;
                show_message("Messenger wins!");
                //End game
            } else if(tile.image_index != 2 && tile.image_index != 3) {
                instance_create(objMessenger.x, objMessenger.y, objFootprint);
            }
        }
    break;
    case PKT_UPDATE_TURNSWITCH:
        //Tell surrounding tiles
        
        var myposx = 0;
        var myposy = 0;
        if(global.messenger){    
            with(objFootprint) {
                event_user(0);
            }
            myposx = objMessenger.x;
            myposy = objMessenger.y;
        }else {
            myposx = objKnight.x;
            myposy = objKnight.y;        
        }
        var tile;
        tile[1] = instance_position(myposx - sprite_get_width(sprTile),myposy,objTile);
        tile[2] = instance_position(myposx - sprite_get_width(sprTile)/2,myposy-3/4*sprite_get_height(sprTile),objTile);
        tile[3] = instance_position(myposx + sprite_get_width(sprTile)/2,myposy-3/4*sprite_get_height(sprTile),objTile);
        tile[4] = instance_position(myposx + sprite_get_width(sprTile),myposy,objTile);
        tile[5] = instance_position(myposx + sprite_get_width(sprTile)/2,myposy+3/4*sprite_get_height(sprTile),objTile);
        tile[6] = instance_position(myposx - sprite_get_width(sprTile)/2,myposy+3/4*sprite_get_height(sprTile),objTile);
        for(i = 1; i < 7; i++) {
            if(tile[i] != noone && tile[i].image_index != 4 && tile[i].image_index != 5
            && !(global.messenger && tile[i].x == objKnight.x && tile[i].y == objKnight.y)){
                //show_debug_message("yep!");
                    tile[i].canmove = true;
                    instance_create(tile[i].x, tile[i].y, objHighlight);
                }else {
                //show_debug_message("nope!");    
                }
        }        
        if(!global.messenger){
            tile[7] = instance_position(myposx, myposy, objTile);
            tile[7].canmove = true;
            instance_create(tile[7].x, tile[7].y, objHighlight);            
        }
        
        global.turn = true;
    break
}
