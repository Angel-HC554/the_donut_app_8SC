import 'package:flutter/material.dart';
import 'package:donut_app_8sc/utils/donutTile.dart';

class DonutTab extends StatelessWidget {
  final Function(double, String) onAddToCart;
  //Lista de donas
  final List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Vanilla", "50", Colors.yellow, "lib/images/vanilla_donut.png"],
    ["Glazed", "60", Colors.green, "lib/images/glazed_donut.png"],
    ["Purple Glazed", "70", Colors.blueAccent, "lib/images/purple_donut.png"],
    ["Cinnamon", "80", Colors.orange, "lib/images/cinnamon_donut.png"]
  ];
  DonutTab({super.key, required this.onAddToCart});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12),
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
      itemCount: donutsOnSale.length,
    );
  }
}
