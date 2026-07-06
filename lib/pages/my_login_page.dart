import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLoginPage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController usuarioController;
  late final TextEditingController passwordController;
  late AnimationController _animationController;
  String rol = "Docente";

  @override
  void initState() {
    super.initState();
    usuarioController = TextEditingController();
    passwordController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 61, 96, 148),
              Color.fromARGB(255, 64, 88, 125),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
            child: FadeTransition(
              opacity: _animationController,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOutCubic,
                  ),
                ),
                child: Card(
                  elevation: 12,
                  shadowColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 48,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo y título
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 77, 117, 178),
                                Color.fromARGB(255, 65, 91, 134),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.school_rounded,
                            size: 72,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'EDU ASISTENCIA',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                color: const Color.fromARGB(255, 41, 98, 186),
                                fontSize: 32,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 32),

                        // Campo usuario
                        TextField(
                          controller: usuarioController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            prefixIcon: const Icon(Icons.email_rounded),
                            prefixIconColor: const Color.fromARGB(
                              255,
                              41,
                              98,
                              186,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Campo contraseña
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            prefixIcon: const Icon(Icons.lock_rounded),
                            prefixIconColor: const Color.fromARGB(
                              255,
                              41,
                              98,
                              186,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Dropdown rol
                        DropdownButtonFormField<String>(
                          initialValue: rol,
                          decoration: InputDecoration(
                            labelText: 'Rol de usuario',
                            prefixIcon: const Icon(Icons.badge_rounded),
                            prefixIconColor: const Color.fromARGB(
                              255,
                              41,
                              98,
                              186,
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Docente',
                              child: Text(' Docente'),
                            ),
                            DropdownMenuItem(
                              value: 'Estudiante',
                              child: Text('Estudiante'),
                            ),
                            DropdownMenuItem(
                              value: 'Coordinador',
                              child: Text(' Coordinador'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              if (value != null) rol = value;
                            });
                          },
                        ),
                        const SizedBox(height: 28),

                        // Botón ingresar
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              41,
                              98,
                              186,
                            ),
                            foregroundColor: Colors.white,
                            elevation: 6,
                            shadowColor: const Color.fromARGB(100, 41, 98, 186),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: Text(
                            'Ingresar',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
