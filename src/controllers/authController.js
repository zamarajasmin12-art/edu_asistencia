const db = require('../config/database');
const asistenciaService = require('../services/asistenciaService');

exports.login = (req, res) => {
    const { correo, contrasena, fcm_token } = req.body;

    const usuario = db.usuarios.find(u => u.correo === correo && u.contrasena === contrasena);

    if (!usuario) {
        return res.status(401).json({ error: "Credenciales incorrectas" });
    }

    // Actualizamos el token del dispositivo para las notificaciones
    if (fcm_token) usuario.fcm_token = fcm_token;

    // Disparamos la notificación solicitada según el Rol
    asistenciaService.enviarNotificacionPush(
        usuario.fcm_token, 
        "Inicio de Sesión", 
        `Hola, has ingresado con el rol de ${usuario.rol}`
    );

    // Respondemos a Flutter con el rol para que maneje la navegación en Dart
    res.json({
        mensaje: "Login exitoso",
        usuario: {
            id: usuario.id,
            correo: usuario.correo,
            rol: usuario.rol
        }
    });
};