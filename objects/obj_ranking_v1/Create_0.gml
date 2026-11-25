// ---------- Colores ----------
col_azul   = make_color_rgb(40, 130, 220);
col_azul_h = make_color_rgb(75, 160, 245);
col_texto  = make_color_rgb(200, 190, 230);
col_oro    = make_color_rgb(255, 205, 60);
col_plata  = make_color_rgb(200, 205, 218);
col_bronce = make_color_rgb(205, 130, 70);

// ---------- Posiciones [x1, y1, x2, y2] ----------
cx = room_width / 2;
panel       = [cx - 270, 35, cx + 270, 640];
panel_rank  = [cx - 340, 20, cx + 340, 655];

// Lobby
r_jugar   = [cx - 170, 215, cx + 170, 267];
r_ranking = [cx - 170, 285, cx + 170, 337];
r_demo    = [cx - 170, 355, cx + 170, 407];
r_salir   = [cx - 170, 455, cx + 170, 507];

// Ranking
r_atras   = [cx - 150, 590, cx + 150, 638];

// Ganador
r_g_lobby = [cx - 280, 582, cx - 20, 630];
r_g_otra  = [cx + 20, 582, cx + 280, 630];

jugadores = [
        { nombre: global.user,   puntos: irandom_range(300, 900) },
        { nombre: "ShadowFox", puntos: irandom_range(300, 900) },
        { nombre: "NeoBlitz",  puntos: irandom_range(300, 900) }
];

ranking = [
    { nombre: "ShadowFox",  puntos: 4820, victorias: 31 },
    { nombre: "NeoBlitz",   puntos: 4310, victorias: 27 },
    { nombre: "LunaStrike", puntos: 3975, victorias: 24 },
    { nombre: "Kraken",     puntos: 3640, victorias: 21 },
    { nombre: "PixelWolf",  puntos: 3280, victorias: 18 },
    { nombre: "Astra",      puntos: 2950, victorias: 15 },
    { nombre: "Zenith",     puntos: 2610, victorias: 13 },
    { nombre: "TurboCat",   puntos: 2275, victorias: 11 },
    { nombre: "Vortex",     puntos: 1930, victorias: 8 },
    { nombre: "Nova",       puntos: 1540, victorias: 6 }
];

function notify(_compID= undefined, _event="", _data={}){}