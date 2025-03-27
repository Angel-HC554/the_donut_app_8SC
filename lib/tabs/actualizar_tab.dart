import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdatePasswordPage extends StatefulWidget {
  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  //Aqui definimos las variable donde se va poner la contraseña actual, la nueva contraseña y la confirmacion de la nueva contrasela
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  //La variable de autentificar
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Verifica si la nueva contraseña cumple con los requisitos
  bool _validatePassword(String password) {
    final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegex.hasMatch(password);
  }

  /// Reautenticar al usuario antes de cambiar la contraseña
  Future<bool> _reauthenticateUser(String currentPassword) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contraseña actual incorrecta')),
      );
      return false;
    }
  }

  /// Cambia la contraseña en Firebase Authentication
  Future<void> _updatePassword() async {
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, llena todos los campos')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las nuevas contraseñas no coinciden')),
      );
      return;
    }

    //Verifica si la contraseña es valida
    if (!_validatePassword(newPassword)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La nueva contraseña debe contener al menos 1 mayúscula, 1 minúscula y 1 número')),
      );
      return;
    }

    // Reautenticación del usuario antes de cambiar la contraseña
    bool isAuthenticated = await _reauthenticateUser(currentPassword);
    if (!isAuthenticated) return;

    //El try y catch es por si surge un error, no me corrompa los datos o se carge mal algo
    //Ayuda a evitar posibles errores
    try {
      await _auth.currentUser!.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contraseña actualizada correctamente')),
      );
      //Te regresa a la pagina anterior
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar la contraseña')),
      );
    }
  }

  //Se inicia lo que ve el usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Titulo que aparece alado de la flecha de regresar
      appBar: AppBar(title: Text('Actualizar Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: currentPasswordController,
              obscureText: true,
              //Estos son como los placeholder en web
              decoration: InputDecoration(labelText: 'Contraseña Actual'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Nueva Contraseña'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmar Nueva Contraseña'),
            ),
            SizedBox(height: 20),
            //Es el boton que va a actulizar la contraseña llamando a la funcion que definimos
            ElevatedButton(
              onPressed: _updatePassword,
              child: Text('Actualizar Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}

