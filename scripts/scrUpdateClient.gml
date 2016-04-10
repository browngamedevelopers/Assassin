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
        
        var i, j;
        for(i = 0; i < row; i++) {
            for(j = 0; j < col; j++) {
                global.gridClient[i, j] = buffer_read(buffer, buffer_s16);
            }
        }
    break;
    case PKT_UPDATE_READY:
        global.start = true;
        room_goto(rmGame);
    break;
}
