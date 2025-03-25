import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donutTile.dart';

class BurguerTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  //Lista de donas
  final List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Simple Burguer", "36", Colors.brown, "lib/images/normal_burguer.png"],
    ["Double Burguer", "45", Colors.red, "lib/images/double_burguer.png"],
    ["Extra cheese", "84", Colors.yellow, "lib/images/extra_queso.png"],
    ["Black burguer", "95", Colors.blueGrey, "lib/images/black_burguer.png"],
    ["Chicken Burguer", "50", Colors.orange, "lib/images/chicken_burguer.png"],
    ["Big Burguer", "40", Colors.green, "lib/images/big_burguer.png"],
    ["Bacon Burguer", "60", Colors.blue, "lib/images/bacon_burguer.png"],
    ["Spicy Burguer", "55", Colors.red, "lib/images/spicy_burguer.jpg"],
  ];
  BurguerTab({super.key, required this.onAddToCart});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Cómo se va a distribuir
      padding: const EdgeInsets.all(12),
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
