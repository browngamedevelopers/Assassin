server = argument0;
numplayers = ds_map_size(server.players);

if(!global.gameStart && numplayers > 1) {
    global.gameStart = true;
    var i;
    buffer_seek(server.buffer, buffer_seek_start, 0);
    buffer_write(server.buffer, buffer_u8, PKT_UPDATE);
    buffer_write(server.buffer, buffer_u8, PKT_UPDATE_READY);
    
    for(i = 0; i < ds_list_size(server.clients); i++) {
        var socket = ds_list_find_value(server.clients, i);
        network_send_packet(socket, server.buffer, buffer_tell(server.buffer));
    }
}
