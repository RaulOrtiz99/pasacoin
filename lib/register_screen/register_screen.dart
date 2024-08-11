import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7ECEF), // Gris claro
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Image.asset('assets/images/logo.png', height: 100), // Asegúrate de tener el logo

            SizedBox(height: 20),

            // Título
            Text(
              'Create your Pasacoin Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF274C77), // Azul profundo
              ),
            ),

            SizedBox(height: 20),

            // Campo de Username
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFA3CEF1), // Azul claro
                labelText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                labelStyle: TextStyle(color: Color(0xFF8B8C89)), // Gris neutro
              ),
            ),

            SizedBox(height: 10),

            // Campo de Email
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFA3CEF1), // Azul claro
                labelText: 'Enter your email',
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

            SizedBox(height: 10),

            // Campo de Confirm Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFA3CEF1), // Azul claro
                labelText: 'Confirm your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                labelStyle: TextStyle(color: Color(0xFF8B8C89)), // Gris neutro
              ),
            ),

            SizedBox(height: 20),

            // Botón de Registro
            ElevatedButton(
              onPressed: () {
                // Acción de registro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6096BA), // Azul medio
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            // Botón de MetaMask
            ElevatedButton.icon(
              onPressed: () {
                // Conectar con MetaMask
              },
              icon: Image.asset('assets/images/metamask.png', height: 24), // Asegúrate de tener el icono de MetaMask
              label: Text('Connect with MetaMask'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF274C77), backgroundColor: Color(0xFFE7ECEF), // Azul profundo
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Color(0xFF274C77)), // Azul profundo
                ),
              ),
            ),

            SizedBox(height: 20),

            // Enlace a Login
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Color(0xFF6096BA)), // Azul medio
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
