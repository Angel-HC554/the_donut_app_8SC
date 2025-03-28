import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donutTile.dart';

class PizzaTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  //Lista de donas
  final List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Pepperoni", "36", Colors.red, "lib/images/pepperoni.png"],
    ["Vegetables", "45", Colors.green, "lib/images/vegetarian.png"],
    ["Mushroom", "84", Colors.yellow, "lib/images/mushroom.png"],
    ["Cheesy", "95", Colors.orange, "lib/images/cheesy.png"],
    ["Hawaiian", "95", Colors.green, "lib/images/hawaiian.png"],
    ["Meat", "95", Colors.brown, "lib/images/meat.png"],
    ["Seafood", "95", Colors.blue, "lib/images/seafood.png"],
    ["Margherita", "95", Colors.pink, "lib/images/margherita.png"]
  ];
  PizzaTab({super.key, required this.onAddToCart});
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
