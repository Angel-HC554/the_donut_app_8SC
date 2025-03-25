import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donutTile.dart';

class PanCakeTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  //Lista de donas
  final List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Golden", "36", Colors.yellow, "lib/images/golden.png"],
    ["Choco", "45", Colors.brown, "lib/images/choco.png"],
    ["Berries", "84", Colors.deepPurple, "lib/images/berries.png"],
    ["Strawberries", "95", Colors.red, "lib/images/fresa.png"],
    ["Cookie", "50", Colors.brown, "lib/images/cookie.png"],
    ["Cream", "60", Colors.blue, "lib/images/cream.png"],
    ["Vanilla", "70", Colors.yellow, "lib/images/vanilla.png"],
    ["Caramel", "80", Colors.orange, "lib/images/caramel.png"]
  ];
  PanCakeTab({super.key, required this.onAddToCart});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      //Cómo se va a distribuir
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //Tuve que agregar el childAspectRatio para que pueda verse completa toda la informacion
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12),
      //Qué elementos tendrá
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          onTap: () => onAddToCart(
              double.parse(donutsOnSale[index][1]), donutsOnSale[index][0]),
        );
      },
      //Cuántos elementos
      itemCount: donutsOnSale.length,
    );
  }
}
