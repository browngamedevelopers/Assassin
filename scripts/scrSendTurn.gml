animation = argument0;

sendBuffer = buffer_create(1024, buffer_grow, 1);

buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE_TURN);
buffer_write(sendBuffer, buffer_s16, objMessenger.x);
buffer_write(sendBuffer, buffer_s16, objMessenger.y);
buffer_write(sendBuffer, buffer_s16, objKnight.x);
buffer_write(sendBuffer, buffer_s16, objKnight.y);
buffer_write(sendBuffer, buffer_s16, animation);

network_send_packet(global.client.client_socket, sendBuffer, buffer_tell(sendBuffer));
