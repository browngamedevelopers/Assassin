client = argument0;

if(keyboard_check(ord('P'))) {
    buffer_seek(client.sendBuffer, buffer_seek_start, 0);
    buffer_write(client.sendBuffer, buffer_u8, PKT_PING);
    buffer_write(client.sendBuffer, buffer_u32, current_time);
    network_send_packet(client.client_socket, client.sendBuffer, buffer_tell(client.sendBuffer));
}

if(keyboard_check(ord('T')) && global.turn) {
    global.turn = false;
    buffer_seek(client.sendBuffer, buffer_seek_start, 0);
    buffer_write(client.sendBuffer, buffer_u8, PKT_UPDATE);
    buffer_write(client.sendBuffer, buffer_u8, PKT_UPDATE_TURN);
    var i;
    for(i = 0; i < 8; i++) {
        buffer_write(client.sendBuffer, buffer_s16, global.gameInfo[i]);
    }
    network_send_packet(client.client_socket, client.sendBuffer, buffer_tell(client.sendBuffer));
}
