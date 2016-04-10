//Implementation dependant

data = argument0;

playerName = buffer_read(data, buffer_string);
show_debug_message(playerName + " connected");

p = instance_create(0, 0, objNetworkPlayer);
p.playerName = playerName;

return p;
