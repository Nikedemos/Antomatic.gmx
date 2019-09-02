terrain_rules=buffer_create(256,buffer_u8,1);
//populate it with random values - for now!
buffer_seek(terrain_rules, buffer_seek_start, 0);

for (var b=0; b<256; b++)
    {
    buffer_write(terrain_rules,buffer_u8,irandom(255));
    }

