server = argument0;
socket = argument1;

buffer_seek(server.buffer, buffer_seek_start, 0);
buffer_write(server.buffer, buffer_u8, PKT_UPDATE);
buffer_write(server.buffer, buffer_u8, PKT_UPDATE_INFO);
buffer_write(server.buffer, buffer_s16, array_length_1d(global.gameInfoServer));

var i, j;
for(i = 0; i < array_length_1d(global.gameInfoServer); i++) {
    buffer_write(server.buffer, buffer_s16, global.gameInfoServer[i]);
}
network_send_packet(socket, server.buffer, buffer_tell(server.buffer));


buffer_seek(server.buffer, buffer_seek_start, 0);
buffer_write(server.buffer, buffer_u8, PKT_UPDATE);
buffer_write(server.buffer, buffer_u8, PKT_UPDATE_MAP);
buffer_write(server.buffer, buffer_s16, global.gameInfoServer[0]);
buffer_write(server.buffer, buffer_s16, global.gameInfoServer[1]);
buffer_write(server.buffer, buffer_s16, global.gameInfoServer[2]);
buffer_write(server.buffer, buffer_s16, global.gameInfoServer[3]);

for(i = 0; i < global.gameInfoServer[1]; i++) {
    for(j = 0; j < global.gameInfoServer[0]; j++) {
        buffer_write(server.buffer, buffer_s16, global.gridServer[j, i]);
    }
}
network_send_packet(socket, server.buffer, buffer_tell(server.buffer));
