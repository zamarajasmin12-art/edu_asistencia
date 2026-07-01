const db = require('../config/database');

class AsistenciaService {
    // Busca si hay un curso programado en la hora actual
    obtenerCursoActivo() {
        const ahora = new Date();
        // Formato HH:MM (ej. "14:30")
        const horaActual = `${String(ahora.getHours()).padStart(2, '0')}:${String(ahora.getMinutes()).padStart(2, '0')}`;
        
        // Buscamos en el registro programado si calza en la ventana de tiempo
        const horarioMatch = db.registro_programado.find(prog => {
            return horaActual >= prog.hora_inicio && horaActual <= prog.hora_fin;
        });

        if (!horarioMatch) return null;

        // Jalar los detalles del curso correspondiente
        return db.cursos.find(c => c.id === horarioMatch.curso_id);
    }

    // Registra la asistencia si el código QR es válido
    registrarAsistencia(alumnoId, cursoId) {
        const cursoActivo = this.obtenerCursoActivo();
        
        if (!cursoActivo || cursoActivo.id !== parseInt(cursoId)) {
            throw new Error("No puedes marcar asistencia: El curso no está en su horario programado.");
        }

        const nuevaAsistencia = {
            id: db.asistencias.length + 1,
            alumno_id: parseInt(alumnoId),
            curso_id: cursoActivo.id,
            fecha_registro: new Date().toISOString(),
            estado: "PRESENTE"
        };

        db.asistencias.push(nuevaAsistencia);
        return nuevaAsistencia;
    }

    // Simula el envío de la notificación Push que procesará Dart
    enviarNotificacionPush(fcmToken, titulo, mensaje) {
        console.log(`[NOTIFICACIÓN PUSH SENT TO ${fcmToken || 'DISPOSITIVO'}]: ${titulo} - ${mensaje}`);
        // Aquí iría la integración real con el SDK de Firebase Admin de Google
        return true;
    }
}

module.exports = new AsistenciaService();