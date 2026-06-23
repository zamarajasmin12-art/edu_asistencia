import 'package:flutter/material.dart';

class MyQrPage extends StatelessWidget {
  const MyQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text("QR Scanner"),
      ),
      body: const Center(
        child: Icon(
          Icons.qr_code_scanner,
          size: 150,
        ),
      ),
    );
  }
}
=======
      appBar: AppBar(title: const Text("QR Scanner")),
      body: const Center(child: Icon(Icons.qr_code_scanner, size: 150)),
    );
  }
}
>>>>>>> dfe36b4fd72e25e9d5fce6fb77f112647c0c8924
