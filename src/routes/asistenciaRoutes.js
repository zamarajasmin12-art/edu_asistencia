const express = require('express');
const router = express.Router();
const asistenciaController = require('../controllers/asistenciaController');

router.get('/curso-actual', asistenciaController.desplegarCurso);
router.post('/registrar', asistenciaController.marcarAsistencia);

module.exports = router;