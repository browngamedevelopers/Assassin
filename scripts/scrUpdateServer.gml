server = argument0;
socket = argument1;
buffer = argument2;

header = buffer_read(buffer, buffer_u8);
switch(header) {
    case PKT_UPDATE_TURN:
        show_message("server turn");
        var i;
        for(i = 4; i < 8; i++) {
            global.gameInfoServer[i] = buffer_read(buffer, buffer_s16);
        }
        
        buffer_seek(server.buffer, buffer_seek_start, 0);
        buffer_write(server.buffer, buffer_u8, PKT_UPDATE);
        buffer_write(server.buffer, buffer_u8, PKT_UPDATE_TURN);
        
        for(i = 4; i < 8; i++) {
            global.gameInfoServer[i] = buffer_read(buffer, buffer_s16);
        }
        
        for(i = 0; i < ds_list_size(clients); i++) {
            var sock = ds_map_find_value(clients, i);
            if(sock != socket) {
                network_send_packet(sock, server.buffer, buffer_tell(server.buffer));
            }
        }
    break;
}
