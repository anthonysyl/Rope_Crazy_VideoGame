// Step Event del objeto de la cámara

camWidth = 300;// Ancho de la cámara igual al ancho de la room
camHeight = 272; // Alto de la cámara igual al alto de la room

follow = obj_Rope_Player;

xTo = follow.x;
yTo = follow.y;

// Ajusta la velocidad de seguimiento (valores más bajos son más suaves)
followSpeed = 0.1; // Experimenta con diferentes valores

x += (xTo - x) * followSpeed;
y += (yTo - y) * followSpeed;

// Limita la cámara a los bordes de la room
if (x < camWidth * 0.5) {
    x = camWidth * 0.5;
} else if (x > room_width - camWidth * 0.5) {
    x = room_width - camWidth * 0.5;
}

if (y < camHeight * 0.5) {
    y = camHeight * 0.5;
} else if (y > room_height - camHeight * 0.5) {
    y = room_height - camHeight * 0.5;
}

camera_set_view_pos(view_camera[0], x - (camWidth * 0.5), y - (camHeight * 0.5));