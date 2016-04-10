var i,j, xoff, yoff;

xoff = 0;
for(i = 0; i < global.gameInfoClient[1]; i++) {
    if((i mod 2) == 0) {
        yoff = 0;
    } else {
        yoff = sprite_get_height(sprTile) / 2;
    }
    
    for(j = 0; j < global.gameInfoClient[0]; j++) {
        draw_sprite(sprTile, global.gridClient[j, i], xoff + global.gameInfoClient[2], yoff + global.gameInfoClient[3]);
        yoff += sprite_get_height(sprTile);
    }
    xoff += sprite_get_width(sprTile);
}
