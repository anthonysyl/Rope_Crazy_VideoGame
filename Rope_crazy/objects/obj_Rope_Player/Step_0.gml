// Lógica de entrada del jugador
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);

hspd = (key_right - key_left) * spd;

// Cambiar la animación según la entrada del jugador
if (hspd != 0) {
    // El jugador se está moviendo horizontalmente
    sprite_index = spr_Player_Walk;
    image_xscale = sign(hspd); // Invierte la animación si va a la izquierda
} else {
    if (!place_meeting(x, y + 1, obj_Wall)) {
        // El jugador está en el aire (saltando o cayendo)
        sprite_index = spr_Player_VerticalJump;
    } else {
        // El jugador está en reposo
        sprite_index = spr_Player_Idle;
    }
}

// Colisiones horizontales
if place_meeting(x + hspd, y, obj_Wall) {
    while (!place_meeting(x + sign(hspd), y, obj_Wall)) {
        x += sign(hspd);
    }
    hspd = 0;
}

x += hspd;

// Jump
if (place_meeting(x, y + 1, obj_Wall) && key_jump) {
    vspd = -8; // Cambia la velocidad vertical para el salto
}

// Gravedad y colisiones verticales
vspd += grv;

if (place_meeting(x, y + vspd, obj_Wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_Wall)) {
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;
