require('dotenv').config();
const express = require('express');
const cors = require('cors');

const authRoutes = require('./routes/authRoutes');
const asistenciaRoutes = require('./routes/asistenciaRoutes');

const app = express();

// Middlewares para procesar los datos enviados desde Flutter
app.use(cors());
app.use(express.json());

// Declaración de Endpoints Globales
app.use('/api/auth', authRoutes);
app.use('/api/asistencia', asistenciaRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor de Asistencias corriendo en http://localhost:${PORT}`);
});