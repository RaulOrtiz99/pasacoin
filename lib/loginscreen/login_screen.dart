import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE7ECEF), // Gris claro
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight, // Asegura que la pantalla ocupe todo el alto
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Título
                  Text(
                    'Welcome Back to Pasacoin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06, // Título responsivo
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF274C77), // Azul profundo
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02), // Espacio responsivo

                  // Campo de Email o Username
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA3CEF1), // Azul claro
                      labelText: 'Enter your email or username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(color: Color(0xFF8B8C89)), // Gris neutro
                    ),
                  ),

                  SizedBox(height: 10),

                  // Campo de Password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFA3CEF1), // Azul claro
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: TextStyle(color: Color(0xFF8B8C89)), // Gris neutro
                    ),
                  ),

                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color(0xFF6096BA)), // Azul medio
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botón de Login
                  ElevatedButton(
                    onPressed: () {
                      // Acción de login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6096BA), // Azul medio
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botón de MetaMask
                  ElevatedButton.icon(
                    onPressed: () {
                      // Conectar con MetaMask
                    },
                    icon: Icon(Icons.wallet), // Icono predeterminado en lugar de una imagen
                    label: Text('Connect with MetaMask'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF274C77),
                      backgroundColor: Color(0xFFE7ECEF), // Azul profundo
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: Color(0xFF274C77)), // Azul profundo
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Enlace a Registro
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(color: Color(0xFF6096BA)), // Azul medio
                      ),
                    ),
                  ),

                  // Relleno flexible para asegurar que los elementos estén centrados
                  Flexible(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
