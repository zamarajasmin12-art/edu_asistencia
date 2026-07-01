const asistenciaService = require('../services/asistenciaService');

exports.desplegarCurso = (req, res) => {
    const curso = asistenciaService.obtenerCursoActivo();
    
    if (!curso) {
        return res.status(404).json({ mensaje: "No hay ningún curso programado para este horario." });
    }
    
    // Flutter recibirá esto y rellenará el desplegable automáticamente
    res.json({ cursoActivo: curso });
};

exports.marcarAsistencia = (req, res) => {
    const { alumno_id, curso_id } = req.body;

    try {
        const registro = asistenciaService.registrarAsistencia(alumno_id, curso_id);
        res.status(201).json({ mensaje: "Asistencia registrada con éxito", datos: registro });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};