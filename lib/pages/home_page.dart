import 'package:donut_app_8sc/utils/my_tab.dart';
import 'package:flutter/material.dart';

import '../tabs/donut_tab.dart';
import '../tabs/pizza_tab.dart';
import '../tabs/smoothie_tab.dart';
import '../tabs/burger_tab.dart';
import '../tabs/pancake_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //Donut Tab
    const MyTab(
      iconPath: 'lib/icons/donut.png',
      tabName: 'Donuts',
    ),
    //Burguer Tab
    const MyTab(
      iconPath: 'lib/icons/burger.png',
      tabName: 'Burgers',
    ),
    //Smootie Tab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
      tabName: 'Smoothies',
    ),
    //Pancake Tab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
      tabName: 'Pancakes',
    ),
    //Pizza Tab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
      tabName: 'Pizzas',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.grey[800],
          ),
          actions: [
            Padding(
              //Le da padding a la derecha
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            )
          ],
        ),
        body: Column(
          children: [
            //TEXTO I WANT TO EAT
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "EAT",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            //Tab Bar
            TabBar(
              tabs: myTabs,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey[600],
            ),
            Expanded(
                child: TabBarView(children: [
              DonutTab(),
              BurgerTab(),
              SmoothieTab(),
              PanCakeTab(),
              PizzaTab()
            ])),
            //Carrito
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2 Items | \$45.00",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Delivery charge included",
                            style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "View Cart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
