event = argument0;
clickx = argument1;
clicky = argument2;

sendBuffer = buffer_create(1024, buffer_grow, 1);

buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE);
buffer_write(sendBuffer, buffer_u8, PKT_UPDATE_TURN);
buffer_write(sendBuffer, buffer_s16, global.messenger);
buffer_write(sendBuffer, buffer_s16, event);

if(event == 0) {
    if(global.messenger) {
        buffer_write(sendBuffer, buffer_s16, objMessenger.x);
        buffer_write(sendBuffer, buffer_s16, objMessenger.y);
    } else {
        buffer_write(sendBuffer, buffer_s16, objKnight.x);
        buffer_write(sendBuffer, buffer_s16, objKnight.y);
    }
} else if(event == 2) {
    buffer_write(sendBuffer, buffer_s16, clickx);
    buffer_write(sendBuffer, buffer_s16, clicky);
}

network_send_packet(global.client.client_socket, sendBuffer, buffer_tell(sendBuffer));
