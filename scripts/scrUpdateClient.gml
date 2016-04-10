client = argument0;
buffer = argument1;

header = buffer_read(buffer, buffer_u8);
switch(header) {
    case PKT_UPDATE_INFO:
        show_debug_message("Updated Info");
        size = buffer_read(buffer, buffer_s16);
        
        for(i = 0; i < size; i++) {
            global.gameInfoClient[i] = buffer_read(buffer, buffer_s16);
        }
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
            if((i mod 2) == 0) {
                xoff = 0;
            } else {
                xoff = sprite_get_width(sprTile) / 2;
            }
            
            for(j = 0; j < row; j++) {
                tile = instance_create(xoff + lx, yoff + ly, objTile);
                tile.image_index = buffer_read(buffer, buffer_s16);
                global.gridClient[i, j] = tile;
                xoff += sprite_get_width(sprTile);
            }
            yoff += sprite_get_height(sprTile)*3/4;
        }
    break;
    case PKT_UPDATE_READY:
        global.start = true;
        room_goto(rmGame);
    break;
}
