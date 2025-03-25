import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String imageName;
  final VoidCallback onTap;

  //valor fijo del borde circular
  final double borderRadius = 24;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    this.donutColor,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[50],
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          children: [
            //precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$$donutPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: donutColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //imagen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: Image.asset(imageName),
            ),
            //Tarea:texto del sabor del producto con la tienda
            Text(
              donutFlavor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Donkin's",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            //Tarea:Iconos de "Me encanta" y "Agregar"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icono de like
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
