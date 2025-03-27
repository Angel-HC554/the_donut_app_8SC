//import 'package:donnut_app/tabs/actualizar_tab.dart';
import 'package:donut_app_8sc/tabs/actualizar_tab.dart';
import 'package:flutter/material.dart';
//Pagina de perfil con una imagen de perfil sin posibilidad de modificar

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Usamos el Scaffold
    return Scaffold(
      //La app bar solo contiene el titulo hasta arriba y alado va a atener una flecha para regresar a la pantalla anterior
      appBar: AppBar(title: Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Usamos el icono person como foto de perfil pero más grande
            Icon(Icons.person, size: 100, color: Colors.grey),
            SizedBox(height: 20),
            //Se debe sincronizar el nombre de usuario
            Text('Nombre de Usuario', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            //Se debe sincronizar el correo
            Text(
              'correo@ejemplo.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            //Pusimos los botones en un columna y luego en un row para que se acomoden hasta el fondo y en linea
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Acomoda los botones
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        ); // Regresa a la pantalla anterior
                      },
                      child: Text('Cerrar Sesion'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Aquí se envia a la página para actualizar la contraseña
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdatePasswordPage()),
                        );
                      },
                      child: Text('Actualizar Contraseña'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
