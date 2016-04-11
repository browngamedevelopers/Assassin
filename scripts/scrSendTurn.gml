animation = argument0;
newx = argument1;
newy = argument2;

sendBuffer = buffer_create(1024, buffer_grow, 1);

buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE_TURN);
buffer_write(sendBuffer, buffer_s16, animation);
buffer_write(sendBuffer, buffer_s16, newx);
buffer_write(sendBuffer, buffer_s16, newy);

network_send_packet(global.client.client_socket, sendBuffer, buffer_tell(sendBuffer));
