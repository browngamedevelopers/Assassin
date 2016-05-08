playerName = argument0;

show_debug_message("Requesting player: " + playerName);
buffer_seek(global.client.buffer, buffer_seek_start, 0);
buffer_write(global.client.buffer, buffer_u8, PKT_PLAYER_REQUEST);
buffer_write(global.client.buffer, buffer_string, playerName);
network_send_packet(global.client.client_socket, global.client.buffer, buffer_tell(global.client.buffer));

global.name = playerName;
