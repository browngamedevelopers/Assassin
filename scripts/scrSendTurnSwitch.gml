sendBuffer = buffer_create(1024, buffer_grow, 1);

global.gameInfoClient[4] = objMessenger.x;
global.gameInfoClient[5] = objMessenger.y;
global.gameInfoClient[6] = objKnight.x;
global.gameInfoClient[7] = objKnight.y;
global.turn = false;
buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE_TURNSWITCH);

var i;
for(i = 4; i < 8; i++) {
    buffer_write(sendBuffer, buffer_s16, global.gameInfoClient[i]);
}
network_send_packet(global.client.client_socket, sendBuffer, buffer_tell(sendBuffer));
