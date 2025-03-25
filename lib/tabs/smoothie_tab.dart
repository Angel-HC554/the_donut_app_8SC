import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donutTile.dart';

class SmoothieTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  //Lista de donas
  final List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Kiwi", "36", Colors.lightGreen, "lib/images/kiwi.png"],
    ["Strawberry", "45", Colors.pink, "lib/images/strawberry.png"],
    ["Mango", "84", Colors.yellow, "lib/images/Pineapple.png"],
    ["Pineapple", "95", Colors.orange, "lib/images/Mango.png"],
    ["Watermelon", "50", Colors.red, "lib/images/watermelon.png"],
    ["Banana", "40", Colors.yellowAccent, "lib/images/banana.png"],
    ["Coconut", "55", Colors.brown, "lib/images/coconut.png"],
    ["Chocolate", "60", Colors.redAccent, "lib/images/chocolate.png"]
  ];
  SmoothieTab({super.key, required this.onAddToCart});
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
