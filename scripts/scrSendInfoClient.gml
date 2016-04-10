client = argument0;

global.turn = false;
buffer_seek(client.sendBuffer, buffer_seek_start, 0);
buffer_write(client.sendBuffer, buffer_u8, PKT_UPDATE);
buffer_write(client.sendBuffer, buffer_u8, PKT_UPDATE_TURN);
    
var i;
for(i = 4; i < 8; i++) {
    buffer_write(client.sendBuffer, buffer_s16, global.gameInfoClient[i]);
}
network_send_packet(client.client_socket, client.sendBuffer, buffer_tell(client.sendBuffer));
