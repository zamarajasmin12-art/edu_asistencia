// Simulación de nuestra base de datos relacional en memoria
const db = {
    usuarios: [
        { id: 1, correo: "profesor@edu.com", contrasena: "123456", rol: "PROFESOR", fcm_token: "" },
        { id: 2, correo: "alumno@edu.com", contrasena: "123456", rol: "ALUMNO", fcm_token: "" }
    ],
    cursos: [
        { id: 101, nombre_curso: "Taller de Robótica", codigo: "ROB-01" },
        { id: 102, nombre_curso: "Desarrollo Móvil con Flutter", codigo: "FLUT-02" }
    ],
    registro_programado: [
        { 
            id: 1, 
            curso_id: 102, 
            dia_semana: "Miércoles", 
            hora_inicio: "08:00", 
            hora_fin: "23:59" // Ventana amplia para que puedas hacer pruebas a cualquier hora
        }
    ],
    asistencias: []
};

module.exports = db;