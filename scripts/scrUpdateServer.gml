server = argument0;
socket = argument1;
data = argument2;

header = buffer_read(data, buffer_u8);
switch(header) {
    case PKT_UPDATE_TURN:
        buffer_seek(server.sendBuffer, buffer_seek_start, 0);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE_TURN);
        buffer_write(server.sendBuffer, buffer_u8, buffer_read(data, buffer_s16));
        buffer_write(server.sendBuffer, buffer_u8, buffer_read(data, buffer_s16));
        buffer_write(server.sendBuffer, buffer_u8, buffer_read(data, buffer_s16));
        network_send_packet(socket, server.sendBuffer, buffer_tell(server.sendBuffer));;
    break;
    case PKT_UPDATE_TURNSWITCH:
        buffer_seek(server.sendBuffer, buffer_seek_start, 0);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE);
        buffer_write(server.sendBuffer, buffer_u8, PKT_UPDATE_TURNSWITCH);
    
        var i;
        for(i = 4; i < 8; i++) {
            global.gameInfoServer[i] = buffer_read(data, buffer_s16);
            buffer_write(server.sendBuffer, buffer_s16, global.gameInfoServer[i]);
        }
        
        for(i = 0; i < ds_list_size(clients); i++) {
            var sock = ds_list_find_value(clients, i);
            if(sock != socket) {
                network_send_packet(sock, server.sendBuffer, buffer_tell(server.sendBuffer));
            }
        }
    break;
}
