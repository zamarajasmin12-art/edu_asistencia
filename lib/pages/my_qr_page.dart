import 'package:flutter/material.dart';
import 'package:edu_asistencia/widgets/my_menu_drawer.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MyQrPage extends StatefulWidget {
  const MyQrPage({super.key});

  @override
  State<MyQrPage> createState() => _MyQrPageState();
}

class _MyQrPageState extends State<MyQrPage> {
  final MobileScannerController _controller = MobileScannerController();
  String? _lastCode;
  bool _cameraActive = true;

  // Método simple para simular un escaneo durante la presentación.
  Future<void> _simulateScan() async {
    const sample = 'https://example.com/mi-codigo-demo';
    setState(() => _lastCode = sample);

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Código simulado'),
        content: Text(sample),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;
    final String? raw = barcodes.first.rawValue;
    if (raw == null) return;

    await _controller.stop();
    setState(() => _lastCode = raw);

    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Código detectado'),
        content: Text(raw),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );

    // Voltear camera
    await _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyMenuDrawer(),
      appBar: AppBar(
        title: const Text('Escáner QR'),
        actions: [
          IconButton(
            tooltip: 'Alternar linterna',
            icon: const Icon(Icons.flash_on),
            onPressed: () => _controller.toggleTorch(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(controller: _controller, onDetect: _onDetect),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Apunta al código QR para escanear.'),
                const SizedBox(height: 8),
                if (_lastCode != null) Text('Último resultado: $_lastCode'),
                const SizedBox(height: 12),
                // Botón para simular un escaneo
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _simulateScan,
                      child: const Text('Simular escaneo'),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () async {
                        // Reanudar la cámara manualmente.
                        if (_cameraActive) {
                          await _controller.stop();
                        } else {
                          await _controller.start();
                        }
                        setState(() => _cameraActive = !_cameraActive);
                      },
                      child: const Text('Pausar/Reanudar cámara'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
