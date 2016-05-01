server = argument0;
socket = argument1;
data = argument2;

header = buffer_read(data, buffer_u8);
switch(header) {
    case PKT_UPDATE_TURN:
        buffer_seek(server.sendBuffer, buffer_seek_start, 0);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE_TURN);
        player = buffer_read(data, buffer_s16);
        event = buffer_read(data, buffer_s16);
        
        buffer_write(server.sendBuffer, buffer_s16, event);
        
        if(event == 0) {
            posx = buffer_read(data, buffer_s16);
            posy = buffer_read(data, buffer_s16);
            if(player) {
                global.gameInfoServer[4] = posx;
                global.gameInfoServer[5] = posy;
            } else {
                global.gameInfoServer[6] = posx;
                global.gameInfoServer[7] = posy;
            }
            buffer_write(server.sendBuffer, buffer_s16, posx);
            buffer_write(server.sendBuffer, buffer_s16, posy);
        } else if(event == 2) {
            clickx = buffer_read(data, buffer_s16);
            clicky = buffer_read(data, buffer_s16);
            buffer_write(server.sendBuffer, buffer_s16, clickx);
            buffer_write(server.sendBuffer, buffer_s16, clicky);
        }
        
        for(i = 0; i < ds_list_size(clients); i++) {
            var sock = ds_list_find_value(clients, i);
            if(sock != socket) {
                network_send_packet(sock, server.sendBuffer, buffer_tell(server.sendBuffer));
            }
        }
    break;
    case PKT_UPDATE_TURNSWITCH:
        buffer_seek(server.sendBuffer, buffer_seek_start, 0);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE_TURNSWITCH);
        
        for(i = 0; i < ds_list_size(clients); i++) {
            var sock = ds_list_find_value(clients, i);
            if(sock != socket) {
                network_send_packet(sock, server.sendBuffer, buffer_tell(server.sendBuffer));
            }
        }
    break;
}
